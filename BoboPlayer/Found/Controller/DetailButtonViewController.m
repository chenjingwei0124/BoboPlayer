//
//  DetailButtonViewController.m
//  MyMusic
//
//  Created by sajyy on 15/11/2.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "DetailButtonViewController.h"
#import "DetailMusicViewController.h"


#import "UIColor+AddColor.h"
#import "NetHandler.h"

#import "DetailMusicList.h"
#import "MusicListDetailCell.h"

#import "ListModel.h"

@interface DetailButtonViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSDictionary *rootDictionary;

@end

@implementation DetailButtonViewController



-(instancetype)initWithModel:(ListModel *)listModel{
    self = [super init];
    if (self) {
        self.listModel = listModel;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 40) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self handle];
    
}




-(void)preAction:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    MusicListDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MusicListDetailCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
    }
    if (self.listArray.count != 0) {
        cell.detailMusicList = self.listArray[indexPath.row];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CATransition *transition = [CATransition animation];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 0.5;
    [self.view.superview.layer addAnimation:transition forKey:@"立方体效果"];
    if (self.listArray.count!=0) {
        NSInteger albumId = ((DetailMusicList*)self.listArray[indexPath.row]).albumId;
        DetailMusicViewController *detailMusicVC = [[DetailMusicViewController alloc]initWithId:albumId];
        detailMusicVC.view.backgroundColor = [UIColor whiteColor];
        UIView *superView = self.view.superview;
        [self.view removeFromSuperview];
        [superView addSubview:detailMusicVC.view];
        [self.navigationController pushViewController:detailMusicVC animated:YES];
    }
    
}

-(void)backAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)handle{
    self.listArray = [NSMutableArray array];
        NSString *nameString = self.listModel.tname;
            [nameString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            NSString *string = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v1/category/album?calcDimension=hot&categoryId=2&device=android&pageId=1&pageSize=20&status=0&tagName=%@",nameString];
        [NetHandler getDataWithUrl:string completion:^(NSData *data) {
         NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                    NSArray *array = [rootDic objectForKey:@"list"];
                for (NSDictionary *dic in array) {
                    DetailMusicList *detailMusicList = [[DetailMusicList alloc]init];
                    [detailMusicList setValuesForKeysWithDictionary:dic];
                    [self.listArray addObject: detailMusicList];
                }
            });
                 dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
        }];
}

-(void)setListArray:(NSMutableArray *)listArray{
    _listArray = [NSMutableArray array];
    _listArray = listArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end




