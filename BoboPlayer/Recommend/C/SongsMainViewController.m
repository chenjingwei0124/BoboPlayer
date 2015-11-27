
//
//  SongsMainViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongsMainViewController.h"
#import "UIImageView+WebCache.h"
#import "UINavigationBar+Awesome.h"
#import "NetHandler.h"
#import "SongsInList.h"
#import "SongInList2.h"
#import "SongUrl.h"
#import "SongSListTableViewCell.h"
#import "PopHideView.h"
#import "PopListView.h"
#import "SongDataBase.h"

@interface SongsMainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UIView *topVew;
@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)UIButton *backButton;
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UIImageView *imageV1;
@property(nonatomic,strong)UILabel *count;
@property(nonatomic,strong)UILabel *desc;
@property(nonatomic,strong)NSMutableArray *songlist2Arr;
@property(nonatomic,strong)NSMutableArray *urlArr;

@property(nonatomic,strong)UIButton *like;
@property(nonatomic,strong)UIButton *comment;
@property(nonatomic,strong)UIButton *fenxiang;
@property(nonatomic,strong)UILabel *lable1;
@property(nonatomic,strong)UILabel *lable2;
@property(nonatomic,strong)UILabel *lable3;

@property(nonatomic,strong)SongsInList *songsInList;

@property(nonatomic,strong)PopHideView *hideView;
@property(nonatomic,strong)PopListView *listView;
@end

@implementation SongsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.tableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)) style:(UITableViewStylePlain)];
    [self.view addSubview:self.tableV];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];

    

    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    
    
    self.headView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, width, 200))];
    self.tableV.tableHeaderView = self.headView;
    self.imageV  = [[UIImageView alloc]initWithFrame:(CGRectMake(0, -64, self.view.frame.size.width, 264))];
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.list.pic_url]] placeholderImage:nil];
    
    [self.headView addSubview:self.imageV];
    
    self.imageV1 = [[UIImageView alloc]initWithFrame:(CGRectMake(10, 200, 20, 20))];
    self.imageV1.image = [UIImage imageNamed:@"erji"];
    [self.imageV addSubview:self.imageV1];
    
    self.count = [[UILabel alloc]initWithFrame:(CGRectMake(35, 200, 60, 30))];
    [self.imageV addSubview:self.count];
    self.count.textColor = [UIColor whiteColor];
    
    self.desc = [[UILabel alloc]initWithFrame:(CGRectMake(self.count.frame.origin.x+60+5, self.count.frame.origin.y, 200, 30))];
    self.desc.font = [UIFont systemFontOfSize:14];
    [self.imageV addSubview:self.desc];
    self.desc.textColor = [UIColor whiteColor];
    
    
    if (self.song != nil) {
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.song.picUrl]] placeholderImage:nil];
        self.count.text = self.song.listenCount;
        self.navigationItem.title = [NSString stringWithFormat:@"%@",self.song.name];
        self.desc.text = self.song.desc;
        
    }if (self.list != nil) {
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.list.pic_url]] placeholderImage:nil];
        self.count.text = self.list.listen_count;
        self.navigationItem.title = [NSString stringWithFormat:@"%@",self.list.title];
        self.desc.text = self.list.desc;
        self.baseTitleL.text = self.desc.text;
        
    }
    if (self.songNew != nil) {
         [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.songNew.picUrl]] placeholderImage:nil];
        self.navigationItem.title = [NSString stringWithFormat:@"%@",self.songNew.name];
        self.desc.text = self.songNew.name;
        self.baseTitleL.text = self.desc.text;
    }

//    //popHidV
//    self.hideView = [[PopHideView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))];
//    self.hideView.alpha = 0.3;
//    self.hideView.hidden = YES;
//    [self.view addSubview:self.hideView];
//    self.hideView.popHidBlock = ^(void){
//        [self popAction:self.listView.btn];
//    };
//    //popListV
//    self.listView = [[PopListView alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height/2))];
//    self.listView.backgroundColor = [UIColor blackColor];
//    self.listView.alpha = 0.7;
//    [self.view addSubview:self.listView];
//    [self.listView.btn addTarget:self action:@selector(popAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self handle];
    
    [self handle1];
    [self handle2];
    
    [self.view bringSubviewToFront:self.headV];
    [self.view bringSubviewToFront:self.backB];
    [self.view bringSubviewToFront:self.searchB];
    [self.view bringSubviewToFront:self.baseTitleL];
    
}

-(void)handle2
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.dongting.com/song/album/%@?app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008292870991&longtitude=121.2840185211148",[self.songNew.action objectForKey:@"value"]] completion:^(NSData *data) {
        NSLog(@"%@",[self.songNew.action objectForKey:@"value"]);
        
        self.songlist2Arr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSDictionary *dic2 = [dic objectForKey:@"data"];
        NSArray *arr = [dic2 objectForKey:@"songList"];
        for (NSDictionary *dic in arr) {
            SongInList2 *list = [[SongInList2 alloc]init];
            [list setValuesForKeysWithDictionary:dic];
            [self.songlist2Arr addObject:list];
        }
        
        NSLog(@"%ld",self.songlist2Arr.count);
        [self.tableV reloadData];
    }];

}
-(void)handle1
{
   
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.songlist.ttpod.com/songlists/%@?app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13014346888798&longtitude=121.2839832453739",[self.song.action objectForKey:@"value"]] completion:^(NSData *data) {
        self.songsInList = [[SongsInList alloc]init];
        self.songlist2Arr = [NSMutableArray array];
        self.urlArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        [self.songsInList setValuesForKeysWithDictionary:dic];
        NSArray *arr = [dic objectForKey:@"songs"];
        for (NSDictionary *dic in arr) {
            SongInList2 *songlist = [[SongInList2 alloc]init];
            [songlist setValuesForKeysWithDictionary:dic];
            NSArray *arr1 = [dic objectForKey:@"auditionList"];
            for (NSDictionary *dic in arr1) {
                SongUrl *url = [[SongUrl alloc]init];
                [url setValuesForKeysWithDictionary:dic];
                [songlist.auditionList addObject:url];
            }
            [self.songlist2Arr addObject:songlist];
            
        }
        [self.tableV reloadData];
    }];

}
-(void)handle
{
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.songlist.ttpod.com/songlists/%@?app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=8.1.2&active=1&net=2&openudid=5403547a8e74655467908be3608fb3aa5de70422&idfa=4BDC34D2-5B62-4CFF-9FF8-FD31206C1957&utdid=Vi8kmk2JHO4DACDBlaipfoYa&alf=201200&bundle_id=com.ttpod.music&latitude=31.13014346888798&longtitude=121.2839832453739",self.list._id] completion:^(NSData *data) {
        self.songsInList = [[SongsInList alloc]init];
        self.songlist2Arr = [NSMutableArray array];
        self.urlArr = [NSMutableArray array];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
                [self.songsInList setValuesForKeysWithDictionary:dic];
        NSArray *arr = [dic objectForKey:@"songs"];
        for (NSDictionary *dic in arr) {
            SongInList2 *songlist = [[SongInList2 alloc]init];
            [songlist setValuesForKeysWithDictionary:dic];
            NSArray *arr1 = [dic objectForKey:@"auditionList"];
            for (NSDictionary *dic in arr1) {
                SongUrl *url = [[SongUrl alloc]init];
                [url setValuesForKeysWithDictionary:dic];
                [songlist.auditionList addObject:url];
            }
            [self.songlist2Arr addObject:songlist];

        }
        
                [self.tableV reloadData];
    }];
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
-(void)back:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.songlist2Arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    self.like = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.like.frame = CGRectMake(20, 5, 20, 20);
    [self.like setImage:[UIImage imageNamed:@"iconfont-aixin"] forState:(UIControlStateNormal)];
    [view addSubview:self.like];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.8;
    
    self.lable1 = [[UILabel alloc]initWithFrame:(CGRectMake(20, 25, 80, 30))];
    [view addSubview:self.lable1];
    self.lable1.text = self.songsInList.favorite_count;
    self.lable1.textColor = [UIColor whiteColor];
    
    self.comment = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.comment.frame = CGRectMake(self.lable1.frame.origin.x+80, 5, 20, 20);
    [self.comment setImage:[UIImage imageNamed:@"iconfont-pinglun"] forState:(UIControlStateNormal)];
    [view addSubview:self.comment];
    
    self.lable2 = [[UILabel alloc]initWithFrame:(CGRectMake(self.comment.frame.origin.x, 25, 80, 30))];
    self.lable2.textColor = [UIColor whiteColor];
    [view addSubview:self.lable2];
    self.lable2.text = self.songsInList.comment_count;
    
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    SongSListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[SongSListTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    SongInList2 *list = self.songlist2Arr[indexPath.row];
    cell.num.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.name.text = list.name;
    cell.singerName.text = list.singerName;
    cell.count.text = list.favorites;
    [cell.xia addTarget:self action:@selector(popAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return cell;
}
-(void)popAction:(UIButton *)button
{
    if (self.listView.frame.origin.y == self.view.bounds.size.height) {
        [UIView animateWithDuration:0.3 animations:^{
            self.listView.frame = CGRectMake(0, self.view.bounds.size.height/2, self.view.bounds.size.width, self.view.bounds.size.height/2);
        }];
        self.hideView.hidden = NO;
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.listView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height/2);
        }];
        self.hideView.hidden = YES;
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
//    CGFloat offsetY = scrollView.contentOffset.y;
//    if (offsetY > 50) {
//        CGFloat alpha = MIN(1, 1 - ((50 + 64 - offsetY) / 64));
//        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
//    } else {
//        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
//    }
    CGFloat offsetY = scrollView.contentOffset.y;
    self.headV.alpha = offsetY/200;
}

-(void)setList:(SongList *)list
{
    _list = list;
    [self.tableV reloadData];
}
-(void)setSong:(HotSong *)song
{
    _song = song;
//    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.song.picUrl]] placeholderImage:nil];
    [self.tableV reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SongInList2 *list = self.songlist2Arr[indexPath.row];

    NSLog(@"%@", list.songId);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"playGeDan" object:list.songId];

    
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
