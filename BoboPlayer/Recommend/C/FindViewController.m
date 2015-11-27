//
//  FindViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "FindViewController.h"
#import "ScrollView.h"
#import "NetHandler.h"
#import "Poster.h"
#import "CategoryViewCell.h"
#import "CategoryList.h"
#import "UIImageView+WebCache.h"
#import "SongHourViewCell.h"
#import "SongHour.h"
#import "HotSongDesc.h"
#import "HotSong.h"
#import "HotSongViewCell.h"
#import "DateSongViewCell.h"
#import "NewSongViewCell.h"
#import "NewSong.h"
#import "NewSongListViewController.h"
#import "BestNewSongViewCell.h"
#import "NewestMV.h"
#import "EverySong.h"
#import "EverySongViewCell.h"
#import "ThemeSong.h"
#import "ThemeTableViewCell.h"
#import "ThemViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityViewController.h"
#import "OnlyActivity.h"
#import "OnlyActivityViewCell.h"
#import "OnlyActivityViewController.h"
#import "MJRefresh.h"
#import "SongListController.h"
#import "NewestListViewController.h"
#import "RankListViewController.h"
#import "SingerListViewController.h"
#import "SongsMainViewController.h"
#import "NewSongsViewController.h"
#import "SVProgressHUD.h"
#import "SongThemViewController.h"
#import "MVViewController.h"


//
@interface FindViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *posterArr;
@property(nonatomic,strong)NSMutableArray *categoryArr;
@property(nonatomic,strong)NSMutableArray *songHourArr;
@property(nonatomic,strong)NSMutableArray *hotSongDescArr;  //存放所有主题名
@property(nonatomic,strong)NSMutableArray *hotSongArr;
@property(nonatomic,strong)NSMutableArray *dateSongArr;
@property(nonatomic,strong)NewSong *nSong; //亚洲新歌榜
@property(nonatomic,strong)NSMutableArray *bestSongArr;
@property(nonatomic,strong)NSMutableArray *newestArr;
@property(nonatomic,strong)EverySong *everySong;  //每天十首
@property(nonatomic,strong)NSMutableArray *themeArray;
@property(nonatomic,strong)NSMutableArray *activityArr;
@property(nonatomic,strong)NSMutableArray *onlyActivityArr;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    

    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64*2)) style:(UITableViewStylePlain)];
    
    
    self.scrollView = [[ScrollView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 200))];;
    self.tableView.tableHeaderView = self.scrollView;
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(action:) name:@"intoActivityVC" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(intoOnly:) name:@"intoOnlyActivityVC" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(intoOnly:) name:@"intoOnlyActivityVC1" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(intoOnly:) name:@"intoOnlyActivityVC2" object:nil];
    [self posterHandle];
    [self categoryHandle];
    [self songHourHanfle];
    [self hotSongHandle];
    [self dateHandle];
    [self newSongHandle];
    [self bestSongHandle];
    [self newestHandle];
//    [self everySongHandle];
    [self themeSongHandle];
    [self activityHandle];
    [self onlyActivityHandle];
    
    [self setupRefresh];
}


-(void)intoOnly:(NSNotification *)notification
{
    int a = [notification.object intValue];
    OnlyActivity *activity = self.onlyActivityArr[a];
    OnlyActivityViewController *onlyActivityVC = [[OnlyActivityViewController alloc]init];
    onlyActivityVC.activity = activity;
    [self.navigationController pushViewController:onlyActivityVC animated:YES];
    
}
#pragma mark - 上拉加载,下拉刷新
- (void)setupRefresh
{
    //    NSLog(@"进入了setupRefresh");
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    
  
//    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    //进入刷新状态(一进入程序就下拉刷新)
//        [self.tableView headerRereshing];
    
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
}

- (void)headerRereshing
{
    
    //1. 在这调用请求网络数据方法（刷新数据）
    
    
    //2. 2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView headerEndRefreshing];
    });
}
//   进入加载状态
- (void)footerRereshing
{
    //1. 拼接口等操作

    // 请求加载数据

    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView reloadData];
        [self.tableView footerEndRefreshing];
    });
}
-(void)action:(NSNotification *)notification
{
    ActivityViewController *activityVC = [[ActivityViewController alloc]init];
    activityVC.song = notification.object;
    [self.navigationController pushViewController:activityVC animated:YES];

    
}
//独家活动解析
-(void)onlyActivityHandle
{
    [SVProgressHUD show];

    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        [SVProgressHUD dismiss];
        self.onlyActivityArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[13];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic in arr2) {
            OnlyActivity *activity = [[OnlyActivity alloc]init];
            [activity setValuesForKeysWithDictionary:dic];
            [self.onlyActivityArr addObject:activity];
        }
    }];
    [SVProgressHUD dismiss];
}
//活动解析
-(void)activityHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.activityArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[12];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic in arr2) {
            ThemeSong *song = [[ThemeSong alloc]init];
            [song setValuesForKeysWithDictionary:dic];
            [self.activityArr addObject:song];
        }
    }];
}

//音乐主题解析
-(void)themeSongHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.themeArray = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[11];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic in arr2) {
            ThemeSong *song = [[ThemeSong alloc]init];
            [song setValuesForKeysWithDictionary:dic];
            [self.themeArray addObject:song];
        }
        
    }];
}
//每日十首歌解析
-(void)everySongHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
            NSDictionary *dic2 = arr[10];
            NSArray *arr2 = [dic2 objectForKey:@"data"];
        if (arr2.count > 0) {
            NSDictionary *dic3 = arr2[0];
            self.everySong = [[EverySong alloc]init];
            [self.everySong setValuesForKeysWithDictionary:dic3];
        }
    
    }];
}
//最新mv解析
-(void)newestHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.newestArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[8];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic in arr2) {
            NewestMV *mv = [[NewestMV alloc]init];
            [mv setValuesForKeysWithDictionary:dic];
            [self.newestArr addObject:mv];
        }
    }];
}

//最新音乐解析
-(void)bestSongHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.bestSongArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[7];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic in arr2) {
            NewSong *song = [[NewSong alloc]init];
            [song setValuesForKeysWithDictionary:dic];
            [self.bestSongArr addObject:song];
        }
        
    }];
}

//新歌榜解析
-(void)newSongHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[6];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        NSDictionary *dic1 = arr2[0];
       self.nSong = [[NewSong alloc]init];
        [self.nSong setValuesForKeysWithDictionary:dic1];
    }];
}
//星期歌单解析
-(void)dateHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.dateSongArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[4];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic  in arr2) {
            HotSong *song = [[HotSong alloc]init];
            [song  setValuesForKeysWithDictionary:dic];
            [self.dateSongArr addObject:song];
        }
        
    }];
}
//热门歌单解析
-(void)hotSongHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.hotSongDescArr = [NSMutableArray array];
        self.hotSongArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            HotSongDesc *hotSongDesc = [[HotSongDesc alloc]init];
            [hotSongDesc setValuesForKeysWithDictionary:dic];
            [self.hotSongDescArr addObject:hotSongDesc];
        }
        NSDictionary *dic2 = arr[3];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic in arr2) {
            HotSong *hotSong = [[HotSong alloc]init];
            [hotSong setValuesForKeysWithDictionary:dic];
            [self.hotSongArr addObject:hotSong];
        }
        [self.tableView reloadData];
        
    }];
    
}


//songhour解析
-(void)songHourHanfle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.songHourArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[2];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        NSDictionary *dic3 = arr2[0];
        NSArray *arr3 = [dic3 objectForKey:@"songs"];
        for (NSDictionary *dic in arr3) {
            SongHour *songHour = [[SongHour alloc]init];
            [songHour setValuesForKeysWithDictionary:dic];
            [self.songHourArr addObject:songHour];
        }
        [self.tableView reloadData];
        
    }];
}
//categorylist解析
-(void)categoryHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.categoryArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[1];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic in arr2) {
            CategoryList *categorylist = [[CategoryList alloc]init];
            [categorylist setValuesForKeysWithDictionary:dic];
            [self.categoryArr addObject:categorylist];
            
        }
        [self.tableView reloadData];
    }];
}
//海报解析
-(void)posterHandle
{
    [NetHandler getDataWithUrl:@"http://api.dongting.com/frontpage/frontpage?location=0&version=1446111911&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008614035153&longtitude=121.284004548383" completion:^(NSData *data) {
        self.posterArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        NSDictionary *dic2 = arr[0];
        NSArray *arr2 = [dic2 objectForKey:@"data"];
        for (NSDictionary *dic in arr2) {
            Poster *poster = [[Poster alloc]init];
            [poster setValuesForKeysWithDictionary:dic];
            [self.posterArr addObject:poster];
            
        }
        self.scrollView.posterArr = self.posterArr;
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 120;
    }
    if (indexPath.row == 1) {
        return 250;
    }
    if (indexPath.row == 2) {
        return 370;
    }
    if (indexPath.row == 3) {
        return 200;
    }
    if (indexPath.row == 4) {
        return 110;
    }
    if (indexPath.row == 5) {
        return 200;
    }
    if (indexPath.row == 6) {
        return 200;
    }
//    if (indexPath.row == 7) {
//        return 150;
//    }
    if (indexPath.row == 7) {
        return 320;
    }
    if (indexPath.row == 8) {
        return 230;
    }
    if (indexPath.row == 9) {
        return 180;
    }
    return 600;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0) {
        //快捷键入口
        static NSString *reuseIdentifier = @"cell";
        CategoryViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[CategoryViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        
        CategoryList *category1 = self.categoryArr[0];
        [cell.rankListImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",category1.picUrl]] placeholderImage:nil];
        [cell.rankButton addTarget:self action:@selector(intoRank:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.rangkListLable.text = category1.name;
        
        CategoryList *category2 = self.categoryArr[1];
        [cell.songListImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",category2.picUrl]] placeholderImage:nil];
        [cell.songButton addTarget:self action:@selector(intoSongList:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.songListLable.text = category2.name;
        
        CategoryList *category3 = self.categoryArr[2];
        [cell.radioImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",category3.picUrl]] placeholderImage:nil];
        
        cell.radioLable.text = category3.name;
        
        CategoryList *category4 = self.categoryArr[3];
        [cell.singerImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",category4.picUrl]] placeholderImage:nil];
        cell.singerLable.text = category4.name;
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        [cell.singerButton addTarget:self action:@selector(intoSingerList:) forControlEvents:(UIControlEventTouchUpInside)];
        
        return cell;

    }
    if (indexPath.row == 1) {
        //大家都在听 每小时
        static NSString *reuseIdentifier = @"cell2";
        SongHourViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[SongHourViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        
        [cell.moreButton addTarget:self action:@selector(weAction:) forControlEvents:(UIControlEventTouchUpInside)];
        SongHour *songHour = [[SongHour alloc]init];
        songHour = self.songHourArr[0];
        [cell.firstImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",songHour.picUrl]] placeholderImage:nil];
        cell.songLable.text = songHour.name;
        cell.singerLable.text = songHour.singerName;
        cell.loveLable.text = songHour.favorites;
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        
        SongHour *songHour2 = self.songHourArr[1];
        [cell.secondImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",songHour2.picUrl]] placeholderImage:nil];
        cell.secondSongLable.text = songHour2.name;
        cell.secondSingerLable.text = songHour2.singerName;
        cell.secondLoveLable.text = songHour2.favorites;
        
        SongHour *songHour3 = self.songHourArr[2];
        [cell.thirdImageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",songHour3.picUrl]] placeholderImage:nil];
        cell.thirdSongLable.text = songHour3.name;
        cell.thirdSingerLable.text = songHour3.singerName;
        cell.thirdLoveLable.text = songHour3.favorites;
        
        [cell.btn1 addTarget:self action:@selector(hourAction1) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.btn2 addTarget:self action:@selector(hourAction2) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.btn3 addTarget:self action:@selector(hourAction3) forControlEvents:(UIControlEventTouchUpInside)];
        
        return cell;
    }
    if (indexPath.row == 2) {
        //热门歌单
        static NSString *reuseIdentifier = @"cell3";
        HotSongViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[HotSongViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        HotSongDesc *hotSongDesc = self.hotSongDescArr[3];
        cell.title.text = hotSongDesc.name;
        HotSong *hotSong = self.hotSongArr[0];
        [cell.imageV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong.picUrl]] placeholderImage:nil];
        cell.countLable1.text = hotSong.listenCount;
        cell.name1.text = hotSong.name;
        [cell.btn1 addTarget:self action:@selector(SongsList1:) forControlEvents:(UIControlEventTouchUpInside)];
        //song2
        HotSong *hotSong1 = self.hotSongArr[1];
        [cell.imageV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong1.picUrl]] placeholderImage:nil];
        cell.countLable2.text = hotSong1.listenCount;
        [cell.btn2 addTarget:self action:@selector(SongsList2:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.name2.text = hotSong1.name;
        //song3
        HotSong *hotSong2 = self.hotSongArr[2];
        [cell.imageV3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong2.picUrl]] placeholderImage:nil];
        [cell.btn3 addTarget:self action:@selector(SongsList3:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.countLable3.text = hotSong2.listenCount;
        cell.name3.text = hotSong2.name;
        //song4
        HotSong *hotSong3 = self.hotSongArr[3];
        [cell.imageV4 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong3.picUrl]] placeholderImage:nil];
        cell.countLable4.text = hotSong3.listenCount;
        cell.name4.text = hotSong3.name;
        [cell.btn4 addTarget:self action:@selector(SongsList4:) forControlEvents:(UIControlEventTouchUpInside)];
        //song5
        HotSong *hotSong4 = self.hotSongArr[4];
        [cell.imageV5 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong4.picUrl]] placeholderImage:nil];
        cell.countLable5.text = hotSong4.listenCount;
        [cell.btn5 addTarget:self action:@selector(SongsList5:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.name5.text = hotSong4.name;
        
        //song6
        HotSong *hotSong5 = self.hotSongArr[5];
        [cell.imageV6 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong5.picUrl]] placeholderImage:nil];
        cell.countLable6.text = hotSong5.listenCount;
        cell.name6.text = hotSong5.name;
        [cell.btn6 addTarget:self action:@selector(SongsList6:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.moreButton addTarget:self action:@selector(intoSongList:) forControlEvents:(UIControlEventTouchUpInside)];
        
        return cell;

    }
    if (indexPath.row == 3) {
        //星期歌单
        static NSString *reuseIdentifier = @"cell4";
        DateSongViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[DateSongViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        HotSongDesc *hotSongDesc = self.hotSongDescArr[4];
        cell.title.text = hotSongDesc.name;
        [cell.btn1 addTarget:self action:@selector(date1:) forControlEvents:(UIControlEventTouchUpInside)];
        HotSong *hotSong = self.dateSongArr[0];
        [cell.imageV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong.picUrl]] placeholderImage:nil];
        cell.countLable1.text = hotSong.listenCount;
        cell.name1.text = hotSong.name;
        //song2
        HotSong *hotSong1 = self.dateSongArr[1];
        [cell.imageV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong1.picUrl]] placeholderImage:nil];
        [cell.btn2 addTarget:self action:@selector(date2:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.countLable2.text = hotSong1.listenCount;
        cell.name2.text = hotSong1.name;
        //song3
        if (self.dateSongArr.count == 3) {
            HotSong *hotSong2 = self.dateSongArr[2];
            [cell.imageV3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",hotSong2.picUrl]] placeholderImage:nil];
            [cell.btn3 addTarget:self action:@selector(date3:) forControlEvents:(UIControlEventTouchUpInside)];
            cell.countLable3.text = hotSong2.listenCount;
            cell.name3.text = hotSong2.name;
        }
        
        return cell;

    }
    if (indexPath.row == 4) {
        //亚洲新歌榜
        static NSString *reuseIdentifier = @"cell5";
        NewSongViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[NewSongViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        HotSongDesc *hotSongDesc = self.hotSongDescArr[6];
        cell.title.text = hotSongDesc.name;
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.nSong.picUrl]] placeholderImage:nil];
        cell.name.text = self.nSong.name;
        cell.descLable.text = self.nSong.desc;
        return cell;
    }
    if (indexPath.row == 5) {
        //最新音乐
        static NSString *reuseIdentifier = @"cell6";
        BestNewSongViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[BestNewSongViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        HotSongDesc *hotSongDesc = self.hotSongDescArr[7];
        cell.title.text = hotSongDesc.name;
        NewSong *song = self.bestSongArr[0];
        [cell.imageV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",song.picUrl]] placeholderImage:nil];
        [cell.btn1 addTarget:self action:@selector(newest1:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.name1.text = song.name;
        //song2
        NewSong *song1 = self.bestSongArr[1];
        [cell.imageV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",song1.picUrl]] placeholderImage:nil];
        [cell.btn2 addTarget:self action:@selector(newest2:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.name2.text = song1.name;
        //song3
        NewSong *song2 = self.bestSongArr[2];
        [cell.imageV3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",song2.picUrl]] placeholderImage:nil];
        cell.name3.text = song2.name;
        [cell.btn3 addTarget:self action:@selector(newest3:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.moreButton addTarget:self action:@selector(intoNewest:) forControlEvents:(UIControlEventTouchUpInside)];
        
        return cell;

    }
    if (indexPath.row == 6) {
        //最新MV
        static NSString *reuseIdentifier = @"cell7";
        BestNewSongViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[BestNewSongViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        HotSongDesc *hotSongDesc = self.hotSongDescArr[8];
        cell.title.text = hotSongDesc.name;
        
        NewestMV *song = self.newestArr[0];
        [cell.imageV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",song.picUrl]] placeholderImage:nil];
        cell.name1.text = song.name;
        //song2
        NewestMV *song1 = self.newestArr[1];
        [cell.imageV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",song1.picUrl]] placeholderImage:nil];
        cell.name2.text = song1.name;
        //song3
        NewestMV *song2 = self.newestArr[2];
        [cell.imageV3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",song2.picUrl]] placeholderImage:nil];
        cell.name3.text = song2.name;
        
        
        [cell.moreButton addTarget:self action:@selector(moreMVHR) forControlEvents:(UIControlEventTouchUpInside)];
        
        
        return cell;

    }
//    if (indexPath.row == 7) {
//        //每日十首歌
//        static NSString *reuseIdentifier = @"cell8";
//        EverySongViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
//        if (cell == nil) {
//            cell = [[EverySongViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
//        }
//        //设置单元格
//        cell.title.text = self.everySong.name;
//        NSArray *arr = [self.everySong.detail componentsSeparatedByString:@"."];
//        cell.monthLable.text = arr[0];
//        cell.dayLable.text = arr[1];
//        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.everySong.picUrl]] placeholderImage:nil];
//        cell.descLable.text = self.everySong.desc;
//        cell.selectionStyle = UITableViewCellEditingStyleNone;
//        
//        return cell;
//
//    }
    if (indexPath.row == 7) {
        //音乐专题
        static NSString *reuseIdentifier = @"cell9";
        ThemeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[ThemeTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        HotSongDesc *hotSongDesc = self.hotSongDescArr[11];
        cell.title.text = hotSongDesc.name;
        cell.themeArray = self.themeArray;
         [cell.moreButton addTarget:self action:@selector(songTheme:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.collectionView.delegate = self;
        cell.opaque = YES;
        return cell;
    }
    if (indexPath.row == 8) {
        //h活动专区
        
        static NSString *reuseIdentifier = @"cell11";
        ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[ActivityTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
        }
        //设置单元格
        
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        HotSongDesc *hotSongDesc = self.hotSongDescArr[12];
        cell.title.text = hotSongDesc.name;
        cell.ActivityArray = self.activityArr;
        cell.opaque = YES;
        return cell;

    }
    /**
     *  @author 葛宏兵, 15-11-04 17:11:55
     *
     *  独家活动
     */
    static NSString *reuseIdentifier = @"cell12";
    OnlyActivityViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[OnlyActivityViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    HotSongDesc *hotSongDesc = self.hotSongDescArr[13];
    cell.title.text = hotSongDesc.name;
    //1
    OnlyActivity *activity = self.onlyActivityArr[0];
    [cell.button1 setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",activity.picUrl]]]] forState:normal];
    [cell.imageV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",activity.tagUrl]] placeholderImage:nil];
    
    //2
    OnlyActivity *activity1 = self.onlyActivityArr[1];
    [cell.button2 setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",activity1.picUrl]]]] forState:normal];
    [cell.imageV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",activity1.tagUrl]] placeholderImage:nil];
    //3
//    NSLog(@"%ld",self.onlyActivityArr.count);
    OnlyActivity *activity2 = self.onlyActivityArr[2];
    [cell.button3 setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",activity2.picUrl]]]] forState:normal];
    [cell.imageV3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",activity2.tagUrl]] placeholderImage:nil];
    cell.opaque = YES;
    return cell;
    
}

#pragma mark - moreMVHR
-(void)moreMVHR{

    MVViewController *mvVC = [[MVViewController alloc]init];

    [self.navigationController pushViewController:mvVC animated:YES];



}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        NewSongListViewController *newSongVC = [[NewSongListViewController alloc]init];
        newSongVC.nSong = self.nSong;
        [self.navigationController pushViewController:newSongVC animated:YES];
        
    }
}
//点击collectionView
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

        ThemeSong *song = self.themeArray[indexPath.row];
        ThemViewController *themeVC = [[ThemViewController alloc]init];
        themeVC.song = song;
        [self.navigationController pushViewController:themeVC animated:YES];

        
}
-(void)intoSongList:(UIButton *)button
{
    SongListController *songListVC = [[SongListController alloc]init];
    
    
    [self.navigationController pushViewController:songListVC animated:YES];
    
    
}
-(void)intoNewest:(UIButton *)button
{
    NewestListViewController *newestVC = [[NewestListViewController alloc]init];
    [self.navigationController pushViewController:newestVC animated:YES];
    
}
//进去排行榜
-(void)intoRank:(UIButton *)button
{
    RankListViewController *rankVC = [RankListViewController alloc];
    [self.navigationController pushViewController:rankVC animated:YES];
    
}
//进入歌手入口
-(void)intoSingerList:(UIButton *)button
{
    SingerListViewController *singerListVC = [[SingerListViewController alloc]init];
    [self.navigationController pushViewController:singerListVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)SongsList1:(UIButton *)btn
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.hotSongArr[0];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)SongsList2:(UIButton *)btn
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.hotSongArr[1];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)SongsList3:(UIButton *)btn
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.hotSongArr[2];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)SongsList4:(UIButton *)btn
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.hotSongArr[3];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)SongsList5:(UIButton *)btn
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.hotSongArr[4];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)SongsList6:(UIButton *)btn
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.hotSongArr[5];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)date1:(UIButton *)button
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.dateSongArr[0];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)date2:(UIButton *)button
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.dateSongArr[1];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)date3:(UIButton *)button
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.song = self.dateSongArr[2];
    [self.navigationController pushViewController:mainVC animated:YES];
}
-(void)newest1:(UIButton *)button
{
    NewSong *song = self.bestSongArr[0];
    NewSongsViewController *mainVC = [[NewSongsViewController alloc]init];
    mainVC.song = song;
    [self.navigationController pushViewController:mainVC animated:YES];
  
}
-(void)newest2:(UIButton *)button
{
    NewSong *song = self.bestSongArr[1];
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.songNew = song;
    [self.navigationController pushViewController:mainVC animated:YES];
    
}
-(void)newest3:(UIButton *)button
{
    NewSong *song = self.bestSongArr[2];
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    mainVC.songNew = song;
    [self.navigationController pushViewController:mainVC animated:YES];
    
}
-(void)songTheme:(UIButton *)button
{
    SongThemViewController *mainVC1 = [[SongThemViewController alloc]init];
    HotSongDesc *hotSongDesc = self.hotSongDescArr[11];
    mainVC1.title = hotSongDesc.name;
    [self.navigationController pushViewController:mainVC1 animated:YES];
}
-(void)weAction:(UIButton *)button
{
    NewSongsViewController *mainVC = [[NewSongsViewController alloc]init];
    mainVC.title = @"大家都在听";
    mainVC.name = @"大家都在听";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"aaaa" object:nil];
    [self.navigationController pushViewController:mainVC animated:YES];
    

}

-(void)hourAction1
{
    SongHour *songHour = [[SongHour alloc]init];
    songHour = self.songHourArr[0];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playGeDan" object:songHour.songId];
}
-(void)hourAction2
{
    SongHour *songHour = [[SongHour alloc]init];
    songHour = self.songHourArr[1];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playGeDan" object:songHour.songId];
}
-(void)hourAction3
{
    SongHour *songHour = [[SongHour alloc]init];
    songHour = self.songHourArr[2];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playGeDan" object:songHour.songId];
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
