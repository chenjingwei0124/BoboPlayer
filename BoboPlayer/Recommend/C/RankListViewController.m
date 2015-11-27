//
//  RankListViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "RankListViewController.h"
#import "Rank.h"
#import "RankName.h"
#import "SongInRank.h"
#import "NetHandler.h"
#import "UIImageView+WebCache.h"
#import "RankListTableViewCell.h"
@interface RankListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableV;

@property(nonatomic,strong)NSMutableArray *rankNameArr;
@property(nonatomic,strong)NSMutableArray *rankArr1;
@property(nonatomic,strong)NSMutableArray *rankArr2;
@property(nonatomic,strong)NSMutableArray *rankArr3;

@property(nonatomic,strong)NSMutableDictionary *rankDic;
@property(nonatomic,strong)NSMutableDictionary *rankDic2;

@property(nonatomic,strong)NSMutableArray *sectionArr;
//测试
//@property (nonatomic,strong)NSMutableArray *musicArr;
@property(nonatomic,strong)NSMutableArray *songInRankArr1;
@property(nonatomic,strong)NSMutableArray *songInRankArr2;
@property(nonatomic,strong)NSMutableArray *songInRankArr3;



@end

@implementation RankListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.baseTitleL.text = @"排行榜";
    // Do any additional setup after loading the view.
    self.tableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-40 - 64)) style:(UITableViewStylePlain)];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    [self.view addSubview:self.tableV];
    
    [NetHandler getDataWithUrl:@"http://api.songlist.ttpod.com/channels/bhb/children?app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13011881441899&longtitude=121.283999099673" completion:^(NSData *data) {
        self.rankArr1 = [NSMutableArray array];
         self.rankArr2 = [NSMutableArray array];
         self.rankArr3 = [NSMutableArray array];
        self.rankNameArr = [NSMutableArray array];
        self.songInRankArr1 = [NSMutableArray array];
        self.songInRankArr2 = [NSMutableArray array];
        self.songInRankArr3 = [NSMutableArray array];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];

        for (NSDictionary *dic in arr) {
            RankName *rankName = [[RankName alloc]init];
            [rankName setValuesForKeysWithDictionary:dic];
            [self.rankNameArr addObject:rankName];
//            NSMutableArray *aaa = rankName.refs;
//            for (NSDictionary *dicc in aaa) {
//                Rank *rank = [[Rank alloc]init];
//                [rank setValuesForKeysWithDictionary:dicc];
//                [self.rankArr1 addObject:rank];
//                
//            }
        }
//        +++++++++
        NSDictionary *dic1 = arr[0];
        NSArray *arr1 = [dic1 objectForKey:@"refs"];
        for (NSDictionary *dic in arr1) {
            Rank *rank = [[Rank alloc]init];
            [rank setValuesForKeysWithDictionary:dic];
            [self.rankArr1 addObject:rank];
        }
        NSDictionary *dic2 = arr[1];
        NSArray *arr2 = [dic2 objectForKey:@"refs"];
        for (NSDictionary *dic in arr2) {
            Rank *rank = [[Rank alloc]init];
            [rank setValuesForKeysWithDictionary:dic];
            [self.rankArr2 addObject:rank];
        }
        
        NSDictionary *dic3 = arr[2];
        NSArray *arr3 = [dic3 objectForKey:@"refs"];
        for (NSDictionary *dic in arr3) {
            Rank *rank = [[Rank alloc]init];
            [rank setValuesForKeysWithDictionary:dic];
            [self.rankArr3 addObject:rank];
        }
        //+++++++++++++

        
        [self.tableV reloadData];
    }];
    

    self.navigationItem.title = @"排行榜";
}

//- (void)setData
//{
//    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://api.songlist.ttpod.com/channels/bhb/children?app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13011881441899&longtitude=121.283999099673"] completion:^(NSData *data) {
//        
//        self.rankNameArr = [NSMutableArray array];
//        self.rankArr1 = [NSMutableArray array];
//        self.songInRankArr1 = [NSMutableArray array];
//        self.musicArr = [NSMutableArray array];
//        
//        NSArray *rootArr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//        for (NSDictionary *dic in rootArr) {
//            NSString *str = dic[@"name"];
//            [self.rankNameArr addObject:str];
//            NSArray *arr = dic[@"refs"];
//            
//            for (NSDictionary * dic in arr) {
//                Rank *rank = [[Rank alloc]init];
//                [rank setValuesForKeysWithDictionary:dic];
//                [self.rankArr1 addObject:rank];
//                NSDictionary *dic1 = dic[@"image"];
//                
//                NSString *str = dic1[@"pic"];
//                [self.songInRankArr1 addObject:str];
//            }
//            
//            NSArray *songs = dic[@"songs"];
//            for (NSDictionary *dic in songs) {
//                SongInRank *music = [[SongInRank alloc]init];
//                [music setValuesForKeysWithDictionary:dic];
//                [self.musicArr addObject:music];
//            }
//        }
//        NSLog(@"%d \n %d \n %d \n%d",self.rankArr1.count,self.musicArr.count,self.songInRankArr1.count,self.rankNameArr.count);
//        [self.tableV reloadData];
//        
//    }];
//}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.rankNameArr.count;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.rankArr1.count;
    }
    if (section == 1) {
        return  self.rankArr2.count;
    }
    return  self.rankArr3.count;
    
        
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
       RankName *rankName = self.rankNameArr[section];
        return rankName.name;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseIdentifier = @"cell";
    RankListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[RankListTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    
        NSString *name1 = [self.rankNameArr[0]name];
        NSString *name2 = [self.rankNameArr[1]name];
        NSString *name3 = [self.rankNameArr[2]name];
    
        self.rankDic = [@{name1:self.rankArr1,name2:self.rankArr2,name3:self.rankArr3}mutableCopy];
        self.sectionArr = [NSMutableArray arrayWithObjects:name1,name2,name3, nil];
    NSString *str = self.sectionArr[indexPath.section];
    NSArray *arr = self.rankDic[str];
    Rank *rank = arr[indexPath.row];
    NSDictionary *dic = rank.image;
    NSString *picurl = [dic objectForKey:@"pic"];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",picurl]] placeholderImage:nil];
    cell.title.text = rank.title;
    
    if (rank.songs1.count == 1) {
        cell.songLable1.text = [NSString stringWithFormat:@"%@ - %@",[rank.songs1[0]name],[rank.songs1[0]singerName]];
    }
    if (rank.songs1.count == 2) {
        cell.songLable1.text = [NSString stringWithFormat:@"%@ - %@",[rank.songs1[0]name],[rank.songs1[0]singerName]];
        cell.songLable2.text = [NSString stringWithFormat:@"%@ - %@",[rank.songs1[1]name],[rank.songs1[1]singerName]];
    }
    if (rank.songs1.count == 3) {
        cell.songLable1.text = [NSString stringWithFormat:@"%@ - %@",[rank.songs1[0]name],[rank.songs1[0]singerName]];
        cell.songLable2.text = [NSString stringWithFormat:@"%@ - %@",[rank.songs1[1]name],[rank.songs1[1]singerName]];
        cell.songLable3.text = [NSString stringWithFormat:@"%@ - %@",[rank.songs1[2]name],[rank.songs1[2]singerName]];
    }
    

   
    


    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
    
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
