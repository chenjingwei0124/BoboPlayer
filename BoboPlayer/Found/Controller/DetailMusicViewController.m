//
//  DetailMusicViewController.m
//  MyMusic
//
//  Created by sajyy on 15/11/2.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "DetailMusicViewController.h"
#import "PlayMusicViewController.h"

#import "UIColor+AddColor.h"
#import "UIImageView+WebCache.h"
#import "NetHandler.h"
#import "NSString+Characters.h"

#import "AlbumIdModel.h"
#import "AlbumListModel.h"
#import "AlbumTracksModel.h"

#import "TopView.h"
#import "SetView.h"
#import "MusicsTool.h"

#import "DetailTotalMusicCell.h"

@interface DetailMusicViewController () <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)TopView *topView;
@property(nonatomic,strong) NSMutableArray *listArray;
@property(nonatomic,strong)AlbumIdModel *albumIdM;
@property(nonatomic,strong)AlbumListModel *albumListM;
@property(nonatomic,strong)AlbumTracksModel *albumTracksM;
@property(nonatomic,strong)MusicsTool *musicsTool;
@end

@implementation DetailMusicViewController


-(instancetype)initWithId:(NSInteger)albumId{
    self = [super init];
    if (self) {
        self.albumId = albumId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.topView = [[TopView alloc]initWithFrame:CGRectMake(0,64,self.view.bounds.size.width , self.view.bounds.size.height/3.5)];
    self.topView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.topView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height/3.5 + 64, self.view.bounds.size.width, self.view.bounds.size.height*2.5/3.5 - 70) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self handle];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    DetailTotalMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[DetailTotalMusicCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
    }
    if (self.musicsTool.musicArray != 0) {
        cell.albumListModel = self.musicsTool.musicArray[indexPath.row];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    if (self.listArray.count != 0) {
        cell.albumListModel = self.listArray[indexPath.row];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height*2.5/3.5, self.view.bounds.size.width, 50)];
    headerView.backgroundColor = [UIColor greenColor];
    
    SetView *setView = [[SetView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    if (self.albumTracksM != nil) {
        setView.albumIdM = self.albumIdM;
    }
    [setView.relationButton addTarget:self action:@selector(sortAction:) forControlEvents:(UIControlEventTouchUpInside)];
    setView.backgroundColor = [UIColor grayColor];
    [headerView addSubview:setView];
    return headerView;
}

-(void)sortAction:(NSMutableArray *)array{
    array = self.listArray;
    NSMutableArray *albumArray = [NSMutableArray array];
    for (AlbumListModel *alModel in array) {
        [albumArray addObject:[alModel.title pinyinOfName]];
    }
    [albumArray sortedArrayUsingSelector:@selector(compare:)];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1.主动取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PlayMusicViewController *playMusicVC = [[PlayMusicViewController alloc]initWithPlayingMusic:self.listArray[indexPath.row] listArray:self.listArray];
    
    [self.navigationController pushViewController:playMusicVC animated:YES];
}

-(void)handle{
    self.listArray = [NSMutableArray array];
    NSString *url = [NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/%ld/true/1/20?albumId=%ld&isAsc=true&device=android&pageSize=20",self.albumId,self.albumId];
    [NetHandler getDataWithUrl:url completion:^(NSData *data) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSDictionary *albumDic = [rootDic  objectForKey:@"album"];
            self.albumIdM = [[AlbumIdModel alloc]init];
            [self.albumIdM setValuesForKeysWithDictionary:albumDic];

            NSDictionary *albumTrackDic = [rootDic objectForKey:@"tracks"];
            AlbumTracksModel *albumTracksModel = [[AlbumTracksModel alloc]init];
            [albumTracksModel setValuesForKeysWithDictionary:albumTrackDic];
            self.albumTracksM = albumTracksModel;
            
            NSArray *array = [albumTrackDic objectForKey:@"list"];

            for (NSDictionary *dic in array) {
                AlbumListModel *albumListModel = [[AlbumListModel alloc]init];
                [albumListModel setValuesForKeysWithDictionary:dic];
                [self.listArray addObject:albumListModel];
            }
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            self.topView.albumIdModel = self.albumIdM;
            [self.tableView reloadData];
        });
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
