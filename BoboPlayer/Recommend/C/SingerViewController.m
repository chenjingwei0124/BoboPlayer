//
//  SingerViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerViewController.h"
#import "Singer.h"
#import "NetHandler.h"
#import "UIImageView+WebCache.h"
#import "SingerTableViewCell.h"
#import "Singer.h"
#import "SingerMainViewController.h"
#import "SingerInfo.h"

@interface SingerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableV;
@property(nonatomic,strong)NSMutableArray *singerArr;
@property(nonatomic,strong)SingerInfo *singerInfo;
@end

@implementation SingerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.baseTitleL.text = self.list.title;
    self.tableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64*2)) style:(UITableViewStylePlain)];
    
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    [self.view addSubview:self.tableV];
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://v1.ard.tj.itlily.com/ttpod?a=getnewttpod&id=%@&size=1000&page=1&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13004382084314&longtitude=121.2840346564585",self.list.ID] completion:^(NSData *data) {
        self.singerArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
       NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            Singer *singer = [[Singer alloc]init];
            [singer setValuesForKeysWithDictionary:dic];
            [self.singerArr addObject:singer];
        }
        [self.tableV reloadData];
        
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.singerArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    SingerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[SingerTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    Singer *singer = self.singerArr[indexPath.row];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",singer.pic_url]] placeholderImage:nil];
    cell.name.text = singer.singer_name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingerMainViewController *singerMVC = [[SingerMainViewController alloc]init];
    singerMVC.singer = self.singerArr[indexPath.row];
    [self.navigationController pushViewController:singerMVC animated:YES];
    

    
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
