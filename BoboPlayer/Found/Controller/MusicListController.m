//
//  MusicListController.m
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "MusicListController.h"
#import "MusicDetailController.h"
#import "Top50ViewController.h"
#import "DetailButtonViewController.h"
#import "DetailMusicViewController.h"
#import "PlayMusicViewController.h"


#import "UIColor+AddColor.h"
#import "NetHandler.h"
#import "UIImageView+WebCache.h"

#import "NavigationScrollView.h"
#import "PictureScrollView.h"
#import "Top50View.h"

#import "MusicDetailCell.h"
#import "GroupDetailCell.h"
#import "GroupDetailCell3.h"
#import "GroupDetailCell2.h"
#import "ButtonDetailCell.h"

#import "MusicListModel.h"
#import "TagModel.h"
#import "ListModel.h"
#import "categoryContentsModel.h"
#import "listTwoModel.h"
#import "ListThreeModel.h"
#import "ListThreeTModel.h"
#import "FirstKResultsModel.h"
#import "FocusImagesModel.h"
#import "ListFourModel.h"


@interface MusicListController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)NavigationScrollView *navigationScrollView;
@property(nonatomic,strong)PictureScrollView *pictScrollerView;
@property(nonatomic,strong)Top50View *top50View;

@property(nonatomic,strong)NSMutableArray *listArray;
@property(nonatomic,strong)NSMutableArray *listTwoArray;
@property(nonatomic,strong)NSMutableArray *listTTwoArray;
@property(nonatomic,strong)NSMutableArray *listThreeArray;
@property(nonatomic,strong)NSMutableArray *listTThreeArray;
@property(nonatomic,strong)NSMutableArray *listFourArray;
@property(nonatomic,strong)NSMutableArray *detailArray;
@property(nonatomic,strong)NSArray *viewsArray;
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,assign)BOOL isOK;
@end

@implementation MusicListController

- (void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"stopds" object:nil];
    [self.tableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.isOK = YES;
    self.navigationItem.title = @"音乐";
    
    //顶端蓝色的滚动条
    self.navigationScrollView = [[NavigationScrollView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width, 40)];
    self.navigationScrollView.backgroundColor = [UIColor whiteColor];
    self.navigationScrollView.showsHorizontalScrollIndicator = NO;
    self.navigationScrollView.scrollEnabled = YES;
    self.navigationScrollView.contentSize = CGSizeMake(7*self.view.bounds.size.width, 40);
    self.navigationScrollView.contentOffset = CGPointZero;
    self.navigationScrollView.delegate = self;

    [self.view addSubview:self.navigationScrollView];
    
    
    //顶端蓝色条中的按钮
    for (int i = 1; i < 27; i++) {
        [((UIButton *)[self.view viewWithTag:1000+i]) addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.navigationScrollView.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - 90) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tag = 1300;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self handle];
    
    self.musicListView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height - 40) style:(UITableViewStylePlain)];
    self.musicListView.backgroundColor = [UIColor whiteColor];
    self.musicListView.tag = 1301;
    [self.view addSubview: self.musicListView];
    
    //更多按钮中的layout
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc]init];
    collectionViewFlowLayout.minimumInteritemSpacing = 20;
    collectionViewFlowLayout.minimumLineSpacing = 10;
    CGFloat width = (self.view.bounds.size.width - 80 )/4;
    CGFloat height = width;
    collectionViewFlowLayout.itemSize = CGSizeMake(width ,height);
    collectionViewFlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    //点击蓝色的更多按钮,跳转到的页面
    self.moreButtonView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,40, self.view.bounds.size.width, self.view.bounds.size.height-100) collectionViewLayout:collectionViewFlowLayout];
    self.moreButtonView.backgroundColor = [UIColor whiteColor];
    self.moreButtonView.delegate = self;
    self.moreButtonView.dataSource = self;
    self.moreButtonView.showsVerticalScrollIndicator = NO;
    [self.moreButtonView registerClass:[ButtonDetailCell class] forCellWithReuseIdentifier:@"collectionView"];
    [self.view addSubview:self.moreButtonView];
    [self.view bringSubviewToFront:self.tableView];
}


-(void)tapPictAction:(UITapGestureRecognizer *)tap{
    
    PlayMusicViewController *playMusicVC = [[PlayMusicViewController alloc]init];
    playMusicVC.listFourModel = self.listFourArray[tap.view.tag-1200];
    [self.navigationController pushViewController:playMusicVC animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  26;
}

//更多中的collectionView
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collectionView";
    ButtonDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.layer.cornerRadius = cell.bounds.size.width/2;
    cell.layer.borderColor = [[UIColor luse] CGColor];
    cell.layer.borderWidth = 5;
    cell.backgroundColor = [UIColor whiteColor];
    [cell.button addTarget:self action:@selector(buttonDetailAction:) forControlEvents:(UIControlEventTouchUpInside)];
    if (self.listArray.count != 0) {        
        self.listModel = self.listArray[indexPath.row];
        NSString *string = [self.listModel valueForKey:@"tname"];
        [cell.button setTitle:string forState:(UIControlStateNormal)];
        [cell.button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        cell.button.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return cell;
}


//更多中的彩色按钮点击事件
-(void)buttonDetailAction:(UIButton*)button{
    NSLog(@"123");
}


//点击顶端 滚动条按钮 进行页面跳转
-(void)buttonAction:(UIButton *)button{
    DetailButtonViewController *detailButtonVC = [[DetailButtonViewController alloc]initWithModel:(ListModel *)self.listArray[button.tag - 1001]];
    detailButtonVC.view.backgroundColor = [UIColor whiteColor];
    if (button.tag > 1001&& button.tag <= 1026){
        [self.navigationController pushViewController:detailButtonVC animated:YES];
    }
}
-(void)setDetailArray:(NSMutableArray *)detailArray{
    _detailArray = [NSMutableArray array];
    _detailArray = detailArray;
}

//轮播图的循环滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.pictScrollerView.contentOffset.x > 7*self.view.bounds.size.width) {
        self.pictScrollerView.contentOffset = CGPointMake(0, 0);
    }else if (self.pictScrollerView.contentOffset.x <0){
        self.pictScrollerView.contentOffset = CGPointMake(7*self.view.bounds.size.width, 0);
    }
}

//轮播图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/4)];
    headerView.backgroundColor = [UIColor blueColor];
    
    self.pictScrollerView = [[PictureScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2.5/8)];
    self.pictScrollerView.backgroundColor = [UIColor yellowColor];
    self.pictScrollerView.contentSize = CGSizeMake(8*self.view.bounds.size.width, 0);
    self.pictScrollerView.contentOffset = CGPointZero;
    self.pictScrollerView.scrollEnabled = YES;
    self.pictScrollerView.showsHorizontalScrollIndicator = NO;
    self.pictScrollerView.pagingEnabled = YES;
    self.pictScrollerView.directionalLockEnabled = YES;
    self.pictScrollerView.delegate = self;
    if (self.listFourArray.count != 0) {
        self.pictScrollerView.listFourArray = self.listFourArray;
    }
    [headerView addSubview:self.pictScrollerView];
    for (int i = 0; i< 8; i++) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPictAction:)];
            [((UIImageView*)[self.pictScrollerView viewWithTag:1200+i]) addGestureRecognizer:tap];
    }
    
    
    //top50
    self.top50View = [[Top50View alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height*2.5/8, self.view.bounds.size.width, self.view.bounds.size.height*0.9/8)];
    self.top50View.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.top50View addGestureRecognizer:tapGesture];
    
    if (self.listThreeModel != nil) {
        self.top50View.listThreeModel = self.listThreeModel;
    }
    [headerView addSubview:self.top50View];
    
    return headerView;
}

-(void)tapAction:(UITapGestureRecognizer *)tap{
    Top50ViewController *top50VC = [[Top50ViewController alloc]init];
    [self.navigationController pushViewController:top50VC animated:YES];
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return self.view.bounds.size.height*2.5/6;
    }
    else{
        return 0;
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        if (0 == indexPath.row) {
            static NSString *identifier = @"musicDetial";
            MusicDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[MusicDetailCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
            }
            if (self.listTThreeArray.count != 0) {
                cell.listTwoM = self.listTThreeArray[indexPath.section];
            }
            cell.backgroundColor = [UIColor lightGrayColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if (indexPath.row == 1){
            static NSString *identifier = @"groupDetail";
            GroupDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[GroupDetailCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
            }
            if (self.listTThreeArray.count != 0) {
                cell.listTwoM = self.listTThreeArray[indexPath.section];
            }
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else if (indexPath.row == 2){
            static NSString *identifier = @"groupDetail1";
            GroupDetailCell2 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[GroupDetailCell2 alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
            }
            if (self.listTThreeArray.count != 0) {
                cell.listTwoM = self.listTThreeArray[indexPath.section];
            }
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            static NSString *identifier = @"groupDetail2";
            GroupDetailCell3 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[GroupDetailCell3 alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
            }
            if (self.listTThreeArray.count != 0) {
                cell.listTwoM = self.listTThreeArray[indexPath.section];
            }
            cell.backgroundColor = [UIColor whiteColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row == 0) {
        MusicDetailController *musicDetailC = [[MusicDetailController alloc]initWithListTwoModel:self.listTThreeArray[indexPath.section]];
        [self.navigationController pushViewController:musicDetailC animated:YES];
    }
    else{
       NSArray *arry = ((listTwoModel*)self.listTThreeArray[indexPath.section]).list;
        NSDictionary *dic =  arry[indexPath.row -1];
        ListThreeTModel *listThreeTModel = [[ListThreeTModel alloc]init];
        [listThreeTModel setValuesForKeysWithDictionary:dic];
        NSInteger albumId = listThreeTModel.albumId;
        DetailMusicViewController *detailMusicVC = [[DetailMusicViewController alloc]initWithId:albumId];
        [self.navigationController pushViewController:detailMusicVC animated:YES];
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        if ( 0 == indexPath.row) {
            return 50;
        }
        else{
            return 100;
        }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(void)handle{
    self.listArray = [NSMutableArray array];
    self.listTwoArray = [NSMutableArray array];
    self.listTThreeArray = [NSMutableArray array];
    self.listThreeArray = [NSMutableArray array];
    self.listTThreeArray = [NSMutableArray array];
    self.listFourArray = [NSMutableArray array];
    
    NSString *url = @"http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends?categoryId=2&contentType=album&device=android&scale=2&version=4.3.20.2";
    [NetHandler getDataWithUrl:url completion:^(NSData *data) {
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0), ^{
           
            MusicListModel *musicListModel = [[MusicListModel alloc]init];
            [musicListModel setValuesForKeysWithDictionary:rootDic];
            self.musicListModel = musicListModel;
            
            TagModel *tagModel = [[TagModel alloc]init];
            NSDictionary *tagModelDic = [rootDic objectForKey:@"tags"];
            [tagModel setValuesForKeysWithDictionary:tagModelDic];
            self.tagModel = tagModel;
            
            NSArray *listArray = [tagModelDic objectForKey:@"list"];
            for (NSDictionary *listDic in listArray) {
                ListModel *listModel = [[ListModel alloc]init];
                [listModel setValuesForKeysWithDictionary:listDic];
                [self.listArray addObject:listModel];
            }
            NSDictionary *categoryDic = [rootDic objectForKey:@"categoryContents"];
            categoryContentsModel *categoryCM = [[categoryContentsModel alloc]init];
            [categoryCM setValuesForKeysWithDictionary:categoryDic];
            self.categoryModel = categoryCM;
            
            NSArray *listTArray = [categoryDic objectForKey:@"list"];
            for (NSDictionary *listTwoDic in listTArray) {
                listTwoModel *listTM = [[listTwoModel alloc]init];
                [listTM setValuesForKeysWithDictionary:listTwoDic];
                [self.listTwoArray addObject:listTM];
            }
            
            NSDictionary *listThreeDic = listTArray[0];
            NSArray *listThreeArray = [listThreeDic objectForKey:@"list"];
            NSDictionary *listTThreeDic = listThreeArray[0];
            self.listThreeModel = [[ListThreeModel alloc]init];
            [self.listThreeModel setValuesForKeysWithDictionary:listTThreeDic];
            
            NSArray *firstKResultArray = [listTThreeDic objectForKey:@"firstKResults"];
            for (NSDictionary *firstKDic  in firstKResultArray) {
                FirstKResultsModel *firstKResultsModel = [[FirstKResultsModel alloc]init];
                [firstKResultsModel setValuesForKeysWithDictionary:firstKDic];
                [self.listThreeArray addObject:firstKResultsModel];
            }
        
            
            NSMutableArray *firstKArray = [NSMutableArray array];
            for (int i = 1; i < listTArray.count; i++) {
                [firstKArray addObject:listTArray[i]];
            }
            
            for (NSDictionary *threeD in firstKArray) {
                listTwoModel *listTwoM = [[listTwoModel alloc]init];
                [listTwoM setValuesForKeysWithDictionary:threeD];
                [self.listTThreeArray addObject:listTwoM];
            }
            
            NSDictionary *focusImagesDic = [rootDic objectForKey:@"focusImages"];
            FocusImagesModel *focusImageModel = [[FocusImagesModel alloc]init];
            [focusImageModel setValuesForKeysWithDictionary:focusImagesDic];
            self.focusImagesModel = focusImageModel;
            
            NSArray *listFourArray = [focusImagesDic objectForKey:@"list"];
            for (NSDictionary *listFourDic in listFourArray) {
                ListFourModel *listFourModel = [[ListFourModel alloc]init];
                [listFourModel setValuesForKeysWithDictionary:listFourDic];
                [self.listFourArray addObject:listFourModel];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.navigationScrollView.listArray = self.listArray;
                self.pictScrollerView.listFourArray = self.listFourArray;
                self.top50View.listThreeModel = self.listThreeModel;
                [self.tableView reloadData];
            });
        });

    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
