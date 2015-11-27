//
//  NewSongsViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/4.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "NewSongsViewController.h"
#import "SongSListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "NetHandler.h"
#import "SongInList2.h"
#import "PopHideView.h"
#import "PopListView.h"
@interface NewSongsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIImageView  *imageV;
@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)UIView *headView;
@property(nonatomic,strong)UIView *topVew;  //假的tab
@property(nonatomic,strong)UIButton *backButton;  //title
@property (nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)NSMutableArray *songArr;

@property(nonatomic,strong)PopHideView *hideView;
@property(nonatomic,strong)PopListView *listView;
@property(nonatomic,strong)NSMutableArray *weSongs;
@property(nonatomic,strong)NSString  *picArr;
@end

@implementation NewSongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    
    self.navigationController.navigationBar.hidden = YES;
    self.tableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, width, height)) style:(UITableViewStylePlain)];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    [self.view addSubview:self.tableV];
    
    self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(0, -200, self.view.frame.size.width, 200))];
    self.imageV.contentMode = UIViewContentModeScaleAspectFill;
    self.imageV.autoresizesSubviews = YES;
    self.imageV.clipsToBounds = YES;
    
    [self.tableV addSubview:self.imageV];
    
    self.headView = [[UIView alloc]initWithFrame:(CGRectMake(0, -200, width, 200))];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:(CGRectMake(20, 100, width, 30))];
    lable1.textColor = [UIColor whiteColor];
    lable1.text = @"新歌精选";
    [self.headView addSubview:lable1];
    [self.tableV addSubview:self.headView];
    self.tableV.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
    //假的tabBar
    self.topVew = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, width, 64))];
    self.topVew.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.topVew];
    self.topVew.alpha = 0;
    self.lable = [[UILabel alloc]initWithFrame:(CGRectMake(0, 20, self.topVew.frame.size.width, 30))];
    self.lable.textAlignment = NSTextAlignmentCenter;
    if (self.name != nil) {
        self.lable.text = @"大家都在听";
    }else{
           self.lable.text = @"新歌精选";
    }
 
    [self.topVew addSubview:self.lable];


    self.backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.backButton.frame = CGRectMake(10, 30, 20, 20);
    [self.backButton setImage:[UIImage imageNamed:@"iconfont-zuojiantou"] forState:(UIControlStateNormal)];
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.backButton];

    
    //popHidV
    self.hideView = [[PopHideView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))];
    self.hideView.alpha = 0.3;
    self.hideView.hidden = YES;
    [self.view addSubview:self.hideView];
    self.hideView.popHidBlock = ^(void){
        [self popAction:self.listView.btn];
    };
    //popListV
    self.listView = [[PopListView alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height/2))];
    self.listView.backgroundColor = [UIColor blackColor];
    self.listView.alpha = 0.7;
    [self.view addSubview:self.listView];
    [self.listView.btn addTarget:self action:@selector(popAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    if (self.name != nil) {
        [self handle1];
        
    }else{
        [self handle];
        [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.song.picUrl]] placeholderImage:nil];
    }
    
    
    

}

-(void)handle1
{
    
    [NetHandler getDataWithUrl:@"http://api.favorite.ttpod.com/favorite/song/plaza?random=0&version=0&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008292870991&longtitude=121.2840185211148" completion:^(NSData *data) {
        self.weSongs = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSDictionary *dic1 = [dic objectForKey:@"data"];
        NSDictionary *dic2 = [dic1 objectForKey:@"image"];
        self.picArr = [dic2 objectForKey:@"pic"];
        
        NSArray *arr = [dic1 objectForKey:@"songs"];
        for (NSDictionary *dic in arr) {
            SongInList2 *list = [SongInList2 alloc];
            [list setValuesForKeysWithDictionary:dic];
            [self.weSongs addObject:list];
        }
        NSLog(@"%ld",self.weSongs.count);
        [self.tableV reloadData];
    }];
}
-(void)back:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)handle
{
    [NetHandler getDataWithUrl:@"http://api.songlist.ttpod.com/songlists/300002376?app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008815039526&longtitude=121.2839978623061" completion:^(NSData *data) {
        self.songArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"songs"];
        for (NSDictionary *dic in arr) {
            SongInList2 *list = [[SongInList2 alloc]init];
            [list setValuesForKeysWithDictionary:dic];
            [self.songArr addObject:list];
        }
        [self.tableV reloadData];
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (self.name != nil) {
        return self.weSongs.count;
    }else{
        return self.songArr.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    SongSListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[SongSListTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    if (self.name == nil) {
        SongInList2 *list = self.songArr[indexPath.row];
        cell.num.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
        cell.name.text = list.name;
        cell.singerName.text = list.singerName;
        cell.count.text = list.favorites;
        [cell.xia addTarget:self action:@selector(popAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }else{
        SongInList2 *list = self.weSongs[indexPath.row];
        cell.num.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
        cell.name.text = list.name;
        cell.singerName.text = list.singerName;
        cell.count.text = list.favorites;
        [cell.xia addTarget:self action:@selector(popAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.picArr]] placeholderImage:nil];
    }
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //下拉宽松图
        CGFloat y = scrollView.contentOffset.y;
        CGRect frame = self.imageV.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        self.imageV.frame = frame;
    
    self.topVew.alpha =1- ( - scrollView.contentOffset.y/200);

    
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
