//
//  SongsViewController.m
//  MPlayer
//
//  Created by SUN on 15/10/29.
//  Copyright © 2015年 孙海睿. All rights reserved.
//

#import "SongsViewController.h"
#import "UIColor+AddColor.h"
#import "MyZoomingHeaderView.h"
#import "AddNewSongToSongListTableViewCell.h"
#import "UIScrollView+LJWZoomingHeader.h"
#import "SearchViewController.h"
#import "NetHandler.h"
#import "SHRSongsListTableViewCell.h"
#import "SongDataBase.h"


@interface SongsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) MyZoomingHeaderView *headerView;

@property (nonatomic, assign)NSInteger index;

@property (nonatomic, strong)NSMutableArray *songArr;

@end

@implementation SongsViewController

- (void)viewWillAppear:(BOOL)animated{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *str = [NSString stringWithFormat:@"songOflist%@", self.cellName];
    self.array = [ud objectForKey:str];
    
    self.songArr = [NSMutableArray array];
    for (self.index = 0; self.index < self.array.count; self.index++) {
        [self songLHandle];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tableView =[[UITableView alloc]initWithFrame:(CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 * 2)) style:(UITableViewStyleGrouped)];
    
    //
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor huiseColor];
    
    [self.tableView addZoomingHeaderView:[self testHeaderView]];
    
    [self.view addSubview:self.tableView];
    
    
   
    
    
}

#pragma mark - headerView
- (MyZoomingHeaderView *)testHeaderView
{
    //给出合适的高宽，乱来的话我也不知道会怎样~
    self.headerView = [[MyZoomingHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.headerView.backgroundColor = [UIColor orangeColor];
    
    
    self.headerView.imageView.image = [UIImage imageNamed:@"back.jpg"];
    
    
    return self.headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableView协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.songArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
        static NSString *resuseIndentifier = @"cell1";
        
        SHRSongsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseIndentifier];
        
        if (cell == nil) {
            cell = [[SHRSongsListTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier];
        }
    SongDataBase *sondBase = self.songArr[indexPath.row];
    cell.textLabel.text = sondBase.songName;
    cell.button.titleLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    [cell.button addTarget:self action:@selector(deleteSongHr:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return cell;

}

-(void)deleteSongHr:(UIButton *)button{
    
//    SHRSongsListTableViewCell *cell = (SHRSongsListTableViewCell *)[[button superview] superview];
    
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *str = [NSString stringWithFormat:@"songOflist%@", self.cellName];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:[ud objectForKey:str]];
    [arr removeObjectAtIndex:[button.titleLabel.text integerValue]];
    self.array = [NSMutableArray arrayWithArray:arr];
    
    self.songArr = [NSMutableArray array];
    
    for (self.index = 0; self.index < self.array.count; self.index++) {
        [self songLHandle];
    }

    [ud setObject:self.array forKey:str];
    [ud synchronize];
    
    [self.tableView reloadData];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SongDataBase *songDataBase = self.songArr[indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playSongData" object:songDataBase];
}

//#pragma mark - 歌曲解析
- (void)songLHandle{
   
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/song/%@", self.array[self.index]] completion:^(NSData *data) {
        NSDictionary *dic1 = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSDictionary *dic2 = [dic1 objectForKey:@"data"];
            
            SongDataBase *sondBase = [[SongDataBase alloc] init];
            [sondBase setValuesForKeysWithDictionary:dic2];
            [self.songArr addObject:sondBase];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
        });
        
    }];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
