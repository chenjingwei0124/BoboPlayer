//
//  SongThemViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/4.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongThemViewController.h"
#import "ThemeModel.h"
#import "UIImageView+WebCache.h"
#import "NetHandler.h"
#import "SVProgressHUD.h"
#import "SongsThemeTableViewCell.h"
#import "SVProgressHUD.h"
#import "ThemViewController.h"
@interface SongThemViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *themeArr;
@property(nonatomic,strong)UITableView *tableV;

@end

@implementation SongThemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.tableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, width, height)) style:(UITableViewStylePlain)];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    [self.view addSubview:self.tableV];
    [self handle];
   
}

-(void)handle
{
    [SVProgressHUD show];
    [NetHandler getDataWithUrl:@"http://api.dongting.com/misc/musiczone/new?app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13008292870991&longtitude=121.2840185211148" completion:^(NSData *data) {
        self.themeArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKey:@"data"];
        for (NSDictionary *dic in arr) {
            ThemeModel *model = [[ThemeModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [self.themeArr addObject:model];
        }
        NSLog(@"%ld",self.themeArr.count);
        
        [self.tableV reloadData];
    }];
    [SVProgressHUD dismiss];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.themeArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    SongsThemeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[SongsThemeTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    ThemeModel *model = self.themeArr[indexPath.row];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.picUrl]] placeholderImage:nil];
    cell.name.text = model.name;
    cell.desc.text = model.desc;
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThemeModel *model = self.themeArr[indexPath.row];
    ThemViewController *mainVC = [[ThemViewController alloc]init];
    mainVC.webUrl = model.actionUrl;
    [self.navigationController pushViewController:mainVC animated:YES];
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
