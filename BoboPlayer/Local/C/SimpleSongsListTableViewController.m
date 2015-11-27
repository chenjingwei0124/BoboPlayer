//
//  SimpleSongsListTableViewController.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SimpleSongsListTableViewController.h"
#import "AddSongsListViewController.h"
#import "SongsViewController.h"
#import "SongDataBase.h"
#import "NetHandler.h"
#import "SHRSongsListTableViewCell.h"


@interface SimpleSongsListTableViewController ()<UITableViewDelegate,UITableViewDataSource,AddSongsListViewControllerDeleagte>

@property (nonatomic,retain) NSArray *arr;
@property (nonatomic,retain) NSMutableArray *songArr;
@property (nonatomic,retain) SongDataBase *songData;


@end

@implementation SimpleSongsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.searchB setBackgroundImage:[UIImage imageNamed:@"iconfont-jia"] forState:(UIControlStateNormal)];
    
    self.tableView= [[UITableView alloc]initWithFrame:(CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 * 2)) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.array = [NSMutableArray array];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    self.array = [ud objectForKey:@"mySongsList"];
    [self.view addSubview:self.tableView];
}


//添加歌单按钮的实现
- (void)searchBAction:(UIButton *)button{
    NSLog(@"添加歌单");
    AddSongsListViewController *addSongsVC = [[AddSongsListViewController alloc]init];
    addSongsVC.delegate = self;
    addSongsVC.view.backgroundColor = [UIColor whiteColor];
    [self presentViewController:addSongsVC animated:YES completion:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *resuseIndentifier = @"cell1";
    
    SHRSongsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseIndentifier];
    
    if (cell == nil) {
        cell = [[SHRSongsListTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier];
        
    }

    
//    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    
//    self.array = [ud objectForKey:@"mySongsList"];
    
    //这边传入歌单名
    cell.title1.text = self.array[indexPath.row];
    [cell.button addTarget:self action:@selector(deleteSongList:) forControlEvents:(UIControlEventTouchUpInside)];

    return cell;
}

-(void)deleteSongList:(UIButton *)button{
    SHRSongsListTableViewCell *cell = (SHRSongsListTableViewCell *)[[button superview] superview];
    
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[ud objectForKey:@"mySongsList"]];
    
    [arr removeObject:cell.title1.text];
    self.array = [NSMutableArray arrayWithArray:arr];
    
    
    
    NSUserDefaults *mySongsListArry = [NSUserDefaults standardUserDefaults];
    [mySongsListArry setObject:self.array forKey:@"mySongsList"];
    [mySongsListArry synchronize];
    
    [self.tableView reloadData];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SHRSongsListTableViewCell *cell = (SHRSongsListTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
//    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
//    NSString *str = [NSString stringWithFormat:@"songOflist%@",cell.title1.text];
//    NSArray *arr = [ud objectForKey:str];

    
    SongsViewController *songsVC =[[SongsViewController alloc]init];
    
//    songsVC.array = arr;
    songsVC.cellName = cell.title1.text;
    
    
    songsVC.view.backgroundColor = [UIColor whiteColor];
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 2 - 50, self.headV.frame.size.height / 2 - 30 / 2 + 10, 100, 40))];
    titlelabel.font = [UIFont systemFontOfSize:20];
    titlelabel.textAlignment = YES;
    titlelabel.textColor = [UIColor whiteColor];
    [songsVC.headV addSubview:titlelabel];
    [self.navigationController pushViewController:songsVC animated:YES];


}
-(void)AddSongsListViewControllerBackFront:(AddSongsListViewController *)secondVC textFieldText:(NSString *)text{
   

    NSMutableArray *arr = [NSMutableArray array];
    NSUserDefaults *ud1 = [NSUserDefaults standardUserDefaults];
    arr = [ud1 objectForKey:@"mySongsList"];
    
    self.array = [NSMutableArray arrayWithArray:arr];
    [self.array addObject:text];


    
    NSUserDefaults *mySongsListArry = [NSUserDefaults standardUserDefaults];
    [mySongsListArry setObject:self.array forKey:@"mySongsList"];
    [mySongsListArry synchronize];
    
    [self.tableView reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}




@end
