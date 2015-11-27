//
//  SingerMainViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerMainViewController.h"
#import "NetHandler.h"
#import "UIImageView+WebCache.h"
#import "SingerView.h"
#import "SongsView.h"
#import "SongInfo.h"
#import "MJRefresh.h"
#import "AlbumInfo.h"
#import "AlbumView.h"
#import "VideoInfo.h"
#import "VideoUrl.h"
#import "VideoView.h"
#import "MJRefresh.h"
#import "UINavigationBar+Awesome.h"
@interface SingerMainViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UIView *topVew;  //假的tab
//@property(nonatomic,strong)UIImageView *backImageV;
@property(nonatomic,strong)UIButton *backButton;  //title
@property (nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)UILabel *singerName;
@property(nonatomic,strong)UILabel *follow;
@property(nonatomic,strong)UILabel *comment;
@property(nonatomic,strong)UILabel *songs;
@property(nonatomic,strong)UILabel *albums;
@property(nonatomic,strong)UILabel *video;
@property(nonatomic,strong)UILabel *inFo;
@property(nonatomic,strong)UIButton *button1;
@property(nonatomic,strong)UIButton *button2;
@property(nonatomic,strong)UIButton *button3;
@property(nonatomic,strong)UIButton *button4;

@property(nonatomic,strong)UIScrollView *scrollView2;
@property(nonatomic,strong)SingerView *singerInfoView;
@property(nonatomic,strong)SongsView *songsInfoView;
@property(nonatomic,strong)NSMutableArray  *songsArr;
@property(nonatomic,strong)NSMutableArray *albumArr;
@property(nonatomic,strong)AlbumView *ablumView;
@property(nonatomic,strong)NSMutableArray *videoArr;
@property(nonatomic,strong)VideoView *videoView;

@property(nonatomic,strong)UITableView *tableV1;
@property(nonatomic,strong)UITableView *tableV2;
@property(nonatomic,strong)UITableView *tableV3;
@property(nonatomic,strong)UITableView *tableV4;

@end

@implementation SingerMainViewController
static NSInteger tag = 50;
static NSInteger tag1 = 1;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];

//    self.tableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)) style:(UITableViewStylePlain)];
//    self.tableV.delegate = self;
//    self.tableV.dataSource = self;
//    [self.view addSubview:self.tableV];
//    
//    self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(0, -200, self.view.frame.size.width, 200))];
//    self.imageV.contentMode = UIViewContentModeScaleAspectFill;
//    self.imageV.autoresizesSubviews = YES;
//    self.imageV.clipsToBounds = YES;
//  
//    [self.tableV addSubview:self.imageV];
//    self.tableV.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
        //图片上的信息
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.tableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, width, height))];
    self.tableV.delegate = self ;
    self.tableV.dataSource = self;
    [self.view addSubview:self.tableV];
    self.headView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, width, 200))];
    self.tableV.tableHeaderView = self.headView;
    
    self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(0, -100, width, self.headView.frame.size.height+100))];
    [self.headView addSubview:self.imageV];
    
    
    
    self.singerName = [[UILabel alloc]initWithFrame:(CGRectMake(10, self.headView.frame.size.height/2, 200, 30))];
    [self.headView addSubview:self.singerName];
    self.singerName.textColor = [UIColor whiteColor];
    UIButton *followBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    followBtn.frame = CGRectMake(10, self.singerName.frame.origin.y+30, 20, 20);
    [followBtn setImage:[UIImage imageNamed:@"iconfont-aixin"] forState:(UIControlStateNormal)];
    [self.headView addSubview:followBtn];
    self.follow = [[UILabel alloc]initWithFrame:(CGRectMake(30, followBtn.frame.origin.y, 100, 30))];
    self.follow.textColor = [UIColor whiteColor];
    [self.headView addSubview:self.follow];
    
    UIButton *commentBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    commentBtn.frame = CGRectMake(30+100+5, self.follow.frame.origin.y, 20, 20);
    [commentBtn setImage:[UIImage imageNamed:@"iconfont-pinglun"] forState:(UIControlStateNormal)];
    [self.headView addSubview:commentBtn];
    self.comment = [[UILabel alloc]initWithFrame:(CGRectMake(commentBtn.frame.origin.y+20+5, commentBtn.frame.origin.y, 100, 30))];
    self.comment.textColor = [UIColor whiteColor];
    [self.headView addSubview:self.comment];
    
   
//    self.scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, width, self.headView.frame.size.height+30))];
//    [self.headView addSubview:self.scrollView];
//    self.scrollView.contentSize = CGSizeMake(width*4, self.scrollView.frame.size.height);
//    self.scrollView.contentOffset = CGPointMake(0, 0);
//    self.scrollView.scrollEnabled = YES;
//    self.scrollView.pagingEnabled = YES;
//    self.scrollView.delegate = self;
//    self.scrollView.showsHorizontalScrollIndicator = YES;
    
    self.scrollView2 = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 230, width, self.tableV.frame.size.height))];
    [self.tableV addSubview:self.scrollView2];
    self.scrollView2.contentSize = CGSizeMake(width*4, self.scrollView2.frame.size.height);
    self.scrollView2.contentOffset = CGPointMake(0, 0);
    self.scrollView2.scrollEnabled = YES;
    self.scrollView2.pagingEnabled = YES;
    self.scrollView2.delegate = self;
    self.scrollView2.showsHorizontalScrollIndicator = YES;
    
    self.singerInfoView = [[SingerView alloc]initWithFrame:(CGRectMake(3*self.scrollView2.frame.size.width, 0, self.scrollView2.frame.size.width, self.scrollView2.frame.size.height))];
    [self.scrollView2 addSubview:self.singerInfoView];
    
    self.songsInfoView = [[SongsView alloc]initWithFrame:(CGRectMake(10, 0, self.scrollView2.frame.size.width, self.scrollView2.frame.size.height - 290))];
    [self.scrollView2 addSubview:self.songsInfoView];
    
    self.ablumView = [[AlbumView alloc]initWithFrame:(CGRectMake(self.scrollView2.frame.size.width, 10, self.scrollView2.frame.size.width, self.scrollView2.frame.size.height - 290))];
    [self.scrollView2 addSubview:self.ablumView];
    
    self.videoView = [[VideoView alloc]initWithFrame:(CGRectMake(self.scrollView2.frame.size.width*2, 10, self.scrollView2.frame.size.width, self.scrollView2.frame.size.height - 290))];
    [self.scrollView2 addSubview:self.videoView];
    
    
   //假的tabBar
//    self.topVew = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, width, 70))];
//    self.topVew.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:self.topVew];
//    self.topVew.alpha = 0;
//    self.lable = [[UILabel alloc]initWithFrame:(CGRectMake(0, 20, self.topVew.frame.size.width, 30))];
//    self.lable.textAlignment = NSTextAlignmentCenter;
//    [self.topVew addSubview:self.lable];
    
//    self.backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    self.backButton.frame = CGRectMake(10, 30, 20, 20);
//    [self.backButton setImage:[UIImage imageNamed:@"iconfont-zuojiantou"] forState:(UIControlStateNormal)];
//    [self.backButton addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
//    [self.view addSubview:self.backButton];
    
   
//    self.scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-200))];
//    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, 0);
//    self.scrollView.bounces = YES;
//    self.scrollView.pagingEnabled = YES;
//    [self.tableV addSubview:self.scrollView];
//    
  
    
    self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self setData];
    [self songsHandle];
    [self albumHandle];
    [self videoHandle];
    
     [self setupRefresh];
    [self setupRefresh1];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionUp];
    self.imageV.userInteractionEnabled = YES;
    [self.imageV addGestureRecognizer:swipe];
    
    
//    [self.view bringSubviewToFront:self.headV];
    [self.view bringSubviewToFront:self.backB];
    [self.view bringSubviewToFront:self.searchB];
//    [self.view bringSubviewToFront:self.baseTitleL];
}
#pragma mark-轻扫手势
-(void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    self.headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 0);
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
    [self.songsInfoView.tableV addFooterWithTarget:self action:@selector(footerRereshing)];
}

- (void)headerRereshing
{
    
    //1. 在这调用请求网络数据方法（刷新数据）
    
    
    //2. 2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.songsInfoView.tableV reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.songsInfoView.tableV headerEndRefreshing];
    });
}
//   进入加载状态
- (void)footerRereshing
{
    //1. 拼接口等操作
    // 请求加载数据
    tag = tag +50;
    //    NSString *str = [NSString stringWithFormat:@"http://api.dongting.com/misc/album/new?page=1&size=%ld&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13011935682507&longtitude=121.2840002266592",tag];
    //    NSString *str1 = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/singer/%@/songs?page=1&size=%ld&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13004382084314&longtitude=121.2840346564585",self.singer.singer_id,tag] completion:^(NSData *data) {
        //        self.songsArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            SongInfo *song = [[SongInfo alloc]init];
            [song setValuesForKeysWithDictionary:dic];
            [self.songsArr addObject:song];
        }
        [self.songsInfoView.tableV reloadData];
    }];
    
    
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.songsInfoView.tableV reloadData];
        [self.songsInfoView.tableV footerEndRefreshing];
    });
}

#pragma mark - 上拉加载,下拉刷新2
- (void)setupRefresh1
{
    //    NSLog(@"进入了setupRefresh");
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    
    
    //    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    //进入刷新状态(一进入程序就下拉刷新)
    //        [self.tableView headerRereshing];
    
    
    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    [self.ablumView.tableV addFooterWithTarget:self action:@selector(footerRereshing1)];
}

- (void)headerRereshing1
{
    
    //1. 在这调用请求网络数据方法（刷新数据）
    
    
    //2. 2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.ablumView.tableV reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.ablumView.tableV headerEndRefreshing];
    });
}
//   进入加载状态
- (void)footerRereshing1
{
    //1. 拼接口等操作
    // 请求加载数据
    tag1 = tag1 +1;
   
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/singer/%@/albums?page=%ld&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.1300825780964&longtitude=121.2840073354862",self.singer.singer_id,tag1] completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            AlbumInfo *info = [[AlbumInfo alloc]init];
            [info setValuesForKeysWithDictionary:dic];
            [self.albumArr addObject:info];
        }
        self.ablumView.albumArr = self.albumArr;
        [self.ablumView.tableV reloadData];
    }];
    
    
    
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.ablumView.tableV reloadData];
        [self.ablumView.tableV footerEndRefreshing];
    });
}

-(void)videoHandle
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/singer/%@/videos?page=1&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13007341041348&longtitude=121.2839760410984",self.singer.singer_id] completion:^(NSData *data) {
        self.videoArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        if (arr.count != 0) {
            for (NSDictionary *dic in arr) {
                VideoInfo *info = [[VideoInfo alloc]init];
                [info setValuesForKeysWithDictionary:dic];
                
                NSArray *arr1 = [dic objectForKey:@"mvList"];
                for (NSDictionary *dic in arr1) {
                    VideoUrl *url = [[VideoUrl alloc]init];
                    [url setValuesForKeysWithDictionary:dic];
                    [info.myList addObject:url];
                }
                [self.videoArr addObject:info];
            }
        }else
        {
            NSLog(@"为空");
            self.videoView.videoArr = self.videoArr;
        }
        NSLog(@"%ld",self.videoArr.count);
        self.videoView.videoArr = self.videoArr;
        [self.tableV reloadData];
    }];
}
-(void)albumHandle
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/singer/%@/albums?page=1&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.1300825780964&longtitude=121.2840073354862",self.singer.singer_id] completion:^(NSData *data) {
        self.albumArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            AlbumInfo *info = [[AlbumInfo alloc]init];
            [info setValuesForKeysWithDictionary:dic];
            [self.albumArr addObject:info];
        }
        self.ablumView.albumArr = self.albumArr;
        [self.tableV reloadData];
    }];
    
}
-(void)songsHandle
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/singer/%@/songs?page=1&size=50&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13004382084314&longtitude=121.2840346564585",self.singer.singer_id] completion:^(NSData *data) {
        self.songsArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            SongInfo *song = [[SongInfo alloc]init];
            [song setValuesForKeysWithDictionary:dic];
            [self.songsArr addObject:song];
        }
        self.songsInfoView.songArr = self.songsArr;
        self.songsInfoView.singer = self.singer;
        [self.tableV reloadData];
    }];
}
- (void)setData
{
    
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/singer/%@?detail=true&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.1300825780964&longtitude=121.2840073354862",self.singer.singer_id] completion:^(NSData *data) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSDictionary *dic1 = [dic objectForKeyedSubscript:@"data"];
        self.singerInfo = [[SingerInfo alloc]init];
        [self.singerInfo setValuesForKeysWithDictionary:dic1];
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.singerInfo.picUrl]] placeholderImage:nil];
//        self.lable.text = self.singerInfo.name;
        self.singerName.text = self.singerInfo.name;
        self.comment.text = self.singerInfo.commentCount;
        self.follow.text = self.singerInfo.followCount;
        
        
        
        self.singerInfoView.info = self.singerInfo;
        [self.tableV reloadData];
    }];

}

-(void)back:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.6;
    self.songs = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, width/4, 30))];
    self.songs.textAlignment = NSTextAlignmentCenter;
    self.songs.textColor = [UIColor blueColor];
    [view addSubview:self.songs];
    self.albums = [[UILabel alloc]initWithFrame:(CGRectMake(self.songs.frame.size.width, 0, self.songs.frame.size.width, 30))];
    self.albums.textAlignment = NSTextAlignmentCenter;
    self.albums.textColor = [UIColor whiteColor];
    [view addSubview:self.albums];
    self.video = [[UILabel alloc]initWithFrame:(CGRectMake(self.albums.frame.origin.x+self.songs.frame.size.width, 0, self.songs.frame.size.width, 30))];
     self.video.textAlignment = NSTextAlignmentCenter;
    self.video.textColor = [UIColor whiteColor];
    [view addSubview:self.video];
    self.inFo = [[UILabel alloc]initWithFrame:(CGRectMake(self.video.frame.origin.x+self.video.frame.size.width, 0, self.video.frame.size.width, 30))];
    self.inFo.textColor = [UIColor whiteColor];
    self.inFo.text = @"歌手信息";
    [view addSubview:self.inFo];
     self.inFo.textAlignment = NSTextAlignmentCenter;
    
    self.button1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button1.frame = CGRectMake(self.songs.frame.origin.x, self.songs.frame.origin.y, self.songs.frame.size.width, self.songs.frame.size.height);
    [self.button1 addTarget:self action:@selector(action1:) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:self.button1];
    
    self.button2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button2.frame = CGRectMake(self.songs.frame.size.width, 0, self.songs.frame.size.width, 30);
    [self.button2 addTarget:self action:@selector(action2:) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:self.button2];
    
    self.button3 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button3.frame = CGRectMake(self.albums.frame.origin.x+self.songs.frame.size.width, 0, self.songs.frame.size.width, 30);
    [self.button3 addTarget:self action:@selector(action3:) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:self.button3];
    
    self.button4 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.button4.frame = CGRectMake(self.video.frame.origin.x+self.video.frame.size.width, 0, self.video.frame.size.width, 30);
    [view addSubview:self.button4];
    [self.button4 addTarget:self action:@selector(action4:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    self.songs.text = [NSString stringWithFormat:@"单曲(%@)",self.singerInfo.songsCount];
    self.albums.text = [NSString stringWithFormat:@"专辑(%@)",self.singerInfo.albumsCount];
    self.video.text = [NSString stringWithFormat:@"MV(%@)",self.singerInfo.videoCount];
    return view;
}
-(void)action1:(UIButton *)button
{
    CGPoint offset = self.scrollView2.contentOffset;
//    CGFloat width = self.scrollView2.frame.size.width;
    [self.scrollView2 setContentOffset:(CGPointMake(0, offset.y))];
    
}
-(void)action2:(UIButton *)button
{
    CGPoint offset = self.scrollView2.contentOffset;
    CGFloat width = self.scrollView2.frame.size.width;
    [self.scrollView2 setContentOffset:(CGPointMake(width, offset.y))];
    
}
-(void)action3:(UIButton *)button
{
    CGPoint offset = self.scrollView2.contentOffset;
    CGFloat width = self.scrollView2.frame.size.width;
    [self.scrollView2 setContentOffset:(CGPointMake(2*width, offset.y))];
    
}
-(void)action4:(UIButton *)button
{
    CGPoint offset = self.scrollView2.contentOffset;
    CGFloat width = self.scrollView2.frame.size.width;
    [self.scrollView2 setContentOffset:(CGPointMake(3*width, offset.y))];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格

    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"%f",scrollView.contentOffset.y);
//    self.topVew.alpha =1- ( - scrollView.contentOffset.y/200);
//    self.navigationController.navigationBar.alpha = 1- ( - scrollView.contentOffset.y/20);

    
    //下拉宽松图
//    CGFloat y = scrollView.contentOffset.y;
//    CGRect frame = self.imageV.frame;
//    frame.origin.y = y;
//    frame.size.height = -y;
//    self.imageV.frame = frame;
    
//    CGPoint offset = self.scrollView.contentOffset;
//    CGFloat width = self.scrollView.frame.size.width;
//    if (offset.x == 0) {
//        self.songs.textColor = [UIColor blueColor];
//        self.albums.textColor = [UIColor whiteColor];
//        self.video.textColor = [UIColor whiteColor];
//        self.inFo.textColor = [UIColor whiteColor];
//        [self.scrollView2 setContentOffset:(CGPointMake(0, offset.y))];
//    }
//    if (offset.x == width) {
//        self.albums.textColor = [UIColor blueColor];
//        self.songs.textColor = [UIColor whiteColor];
//        self.video.textColor = [UIColor whiteColor];
//        self.inFo.textColor = [UIColor whiteColor];
//        [self.scrollView2 setContentOffset:(CGPointMake(width, offset.y))];
//
//    }
//    if (offset.x == 2*width) {
//        self.video.textColor = [UIColor blueColor];
//        self.songs.textColor = [UIColor whiteColor];
//        self.albums.textColor = [UIColor whiteColor];
//        self.inFo.textColor = [UIColor whiteColor];
//        [self.scrollView2 setContentOffset:(CGPointMake(2*width, offset.y))];
//
//    }
//    if (offset.x == 3*width) {
//        self.inFo.textColor = [UIColor blueColor];
//        self.songs.textColor = [UIColor whiteColor];
//        self.albums.textColor = [UIColor whiteColor];
//        self.video.textColor = [UIColor whiteColor];
//        [self.scrollView2 setContentOffset:(CGPointMake(3*width, offset.y))];
//
//    }
    CGPoint offset2 = self.scrollView2.contentOffset;
    CGFloat width2 = self.scrollView2.frame.size.width;
    if (offset2.x == 0) {
        self.songs.textColor = [UIColor blueColor];
        self.albums.textColor = [UIColor whiteColor];
        self.video.textColor = [UIColor whiteColor];
        self.inFo.textColor = [UIColor whiteColor];
        [self.scrollView setContentOffset:(CGPointMake(0, offset2.y))];

        
    }
    if (offset2.x == width2) {
        self.albums.textColor = [UIColor blueColor];
        self.songs.textColor = [UIColor whiteColor];
        self.video.textColor = [UIColor whiteColor];
        self.inFo.textColor = [UIColor whiteColor];
        [self.scrollView setContentOffset:(CGPointMake(width2, offset2.y))];

    }
    if (offset2.x == 2*width2) {
        self.video.textColor = [UIColor blueColor];
        self.songs.textColor = [UIColor whiteColor];
        self.albums.textColor = [UIColor whiteColor];
        self.inFo.textColor = [UIColor whiteColor];
        [self.scrollView setContentOffset:(CGPointMake(2*width2, offset2.y))];

    }
    if (offset2.x == 3*width2) {
        self.inFo.textColor = [UIColor blueColor];
        self.songs.textColor = [UIColor whiteColor];
        self.albums.textColor = [UIColor whiteColor];
        self.video.textColor = [UIColor whiteColor];
        [self.scrollView setContentOffset:(CGPointMake(3*width2, offset2.y))];

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.tableV.delegate = self;
    [self scrollViewDidScroll:self.tableV];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tableV.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
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
