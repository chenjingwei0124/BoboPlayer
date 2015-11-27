//
//  DefaultSongsViewController.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "DefaultSongsViewController.h"
#import "SongDataTools.h"
#import "SongData.h"
#import "SongerCell.h"

@interface DefaultSongsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)SongDataTools *songTools;
@property (nonatomic, strong)NSMutableArray *songArr;
@end

@implementation DefaultSongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.songTools = [[SongDataTools alloc] init];
    if (self.isCollect) {
        [self songDataToArrayIsCollect];
    }else{
        [self songDataToArray];
    }

    
//    [self.searchB setBackgroundImage:[UIImage imageNamed:@"iconfont-jia"] forState:(UIControlStateNormal)];
    
    self.tableView= [[UITableView alloc]initWithFrame:(CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 * 2)) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 2 - 60, self.headV.frame.size.height / 2 - 30 / 2 + 10, 120, 40))];
    if (self.isCollect) {
        titlelabel.text = @"我喜欢";
    }else{
        titlelabel.text = @"默认播放列表";
    }

    titlelabel.font = [UIFont systemFontOfSize:20];
    titlelabel.textAlignment = YES;
    titlelabel.textColor = [UIColor whiteColor];
    [self.headV addSubview:titlelabel];
    
}

//SongTools
- (void)songDataToArray{
    self.songArr = [NSMutableArray arrayWithArray:[self.songTools selectTotalSongArray]];
//    NSLog(@"%@", self.songArr);
}

//SongTools
- (void)songDataToArrayIsCollect{
    self.songArr = [NSMutableArray arrayWithArray:[self.songTools selectCollectSongArray]];
    //    NSLog(@"%@", self.songArr);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *resuseIndentifier = @"cell1";
    
    SongerCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseIndentifier];
    
    if (cell == nil) {
        cell = [[SongerCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:resuseIndentifier];
        
    }
    //    cell.backgroundColor = [UIColor redColor];
    
    //这边传入默认歌名
    SongData *songData = self.songArr[indexPath.row];
    cell.nameL.text = songData.songName;
    cell.authorL.text = [NSString stringWithFormat:@"%@·%@", songData.singerName, songData.albumName];
    
    [cell.setlowB addTarget:self action:@selector(setlowBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return cell;
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
//    NSLog(@"%ld", self.songArr.count);
    return self.songArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [[NSArray alloc] initWithObjects:@"0", [NSString stringWithFormat:@"%ld",indexPath.row], nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"play" object:arr];
}

- (void)setlowBAction:(UIButton *)button{
    SongerCell *cell = (SongerCell *)[[button superview] superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    NSLog(@"%ld", path.row);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"deleteSongData" object:self.songArr[path.row]];
    [self songDataToArray];
    [self.tableView reloadData];
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
