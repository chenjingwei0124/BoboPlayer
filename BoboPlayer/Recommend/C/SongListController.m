//
//  SongListController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongListController.h"
#import "SongListCollectionViewCell.h"
#import "NetHandler.h"
#import "SongList.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "SongsMainViewController.h"
@interface SongListController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray *songListArr;
@property(nonatomic,strong)UICollectionView *collectionView;

@end

//歌单广场
@implementation SongListController
static  NSInteger tag = 10;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.baseTitleL.text = @"歌单";
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 10;
    CGFloat width = (self.view.bounds.size.width-10*3)/2;
    CGFloat height = width;
    
    layout.itemSize = CGSizeMake(width, height);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //视图对象
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:(CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 *2)) collectionViewLayout:layout];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //注册
    [self.collectionView registerClass:[SongListCollectionViewCell class] forCellWithReuseIdentifier:@"songListcell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
    NSString *str = @"http://so.ard.iyyin.com/s/songlist?q=tag:%E6%9C%80%E7%83%AD&page=1&size=10&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13014346888798&longtitude=121.2839832453739";
    NSString *str1 = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"%@",str1] completion:^(NSData *data) {
        self.songListArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            SongList *songlist = [[SongList alloc]init];
            [songlist setValuesForKeysWithDictionary:dic];
            [self.songListArr addObject:songlist];
        }
        [self.collectionView reloadData];
    }];
    
    [self setupRefresh];
    
    
    
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
    [self.collectionView addFooterWithTarget:self action:@selector(footerRereshing)];
}

- (void)headerRereshing
{
    
    //1. 在这调用请求网络数据方法（刷新数据）
    
    
    //2. 2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.collectionView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.collectionView headerEndRefreshing];
    });
}
//   进入加载状态
- (void)footerRereshing
{
    //1. 拼接口等操作
    // 请求加载数据
    tag = tag +10;
    NSString *str = [NSString stringWithFormat:@"http://so.ard.iyyin.com/s/songlist?q=tag:最热&page=1&size=%ld&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13014346888798&longtitude=121.2839832453739",tag];
    NSString *str1 = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"%@",str1] completion:^(NSData *data) {
        self.songListArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            SongList *songlist = [[SongList alloc]init];
            [songlist setValuesForKeysWithDictionary:dic];
            [self.songListArr addObject:songlist];
        }
        [self.collectionView reloadData];
    }];
    
    
   
    // 2.2秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.collectionView reloadData];
        [self.collectionView footerEndRefreshing];
    });
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.songListArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SongListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"songListcell" forIndexPath:indexPath];
    SongList *list = self.songListArr[indexPath.item];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",list.pic_url]] placeholderImage:nil];
    cell.name.text = list.title;
    cell.count.text = list.listen_count;
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SongsMainViewController *mainVC = [[SongsMainViewController alloc]init];
    SongList *list = self.songListArr[indexPath.item];
    mainVC.list = list;
    [self.navigationController pushViewController:mainVC animated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
