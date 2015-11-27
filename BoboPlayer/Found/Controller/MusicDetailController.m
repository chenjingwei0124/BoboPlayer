//
//  MusicDetailController.m
//  MyMusic
//
//  Created by sajyy on 15/10/30.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "MusicDetailController.h"
#import "DetailMusicViewController.h"

#import "UIColor+AddColor.h"
#import "DetailMusicList.h"
#import "MostHotCell.h"
#import "listTwoModel.h"
#import "NetHandler.h"

@interface MusicDetailController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MusicDetailController

-(void)stopPlaying:(NSNotification *)noti{
    NSLog(@"%@",noti.object);
    [noti.object pause];
}

-(instancetype)initWithListTwoModel:(listTwoModel *)listTwoM{
    self = [super init];
    if (self) {
        self.listTwoM = listTwoM;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self handle];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identitier = @"cell";
    MostHotCell *cell = [tableView dequeueReusableCellWithIdentifier:identitier];
    if (!cell) {
        cell = [[MostHotCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identitier];
    }
    if(self.listArray.count != 0){
        cell.detailMusicList = self.listArray[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger albumId = ((DetailMusicList*)self.listArray[indexPath.row]).albumId;
    DetailMusicViewController *detailMusicVC = [[DetailMusicViewController alloc]initWithId:albumId];
    [self.navigationController pushViewController:detailMusicVC animated:YES];

}


-(void)handle{
    self.listArray = [NSMutableArray array];

    NSString *url =[NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/discovery/v1/category/album?calcDimension=hot&categoryId=2&device=android&pageId=1&pageSize=20&status=0&tagName=%@",self.listTwoM.tagName];
    [NetHandler getDataWithUrl:url completion:^(NSData *data) {
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
