//
//  SingerListViewController.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerListViewController.h"
#import "SingerListCollectionViewCell.h"
#import "NetHandler.h"
#import "UIImageView+WebCache.h"
#import "SingerCategory.h"
#import "SingerViewController.h"
@interface SingerListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *singerListArr;
@end

@implementation SingerListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.baseTitleL.text = @"歌手";
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    CGFloat width = (self.view.frame.size.width-5*5)/4;
    CGFloat height = width;
    layout.itemSize = CGSizeMake(width, height);
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //视图对象
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:(CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64*2)) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[SingerListCollectionViewCell class] forCellWithReuseIdentifier:@"singerCell"];
    [self.view addSubview:self.collectionView];
    
    [self singerHandle];
    self.navigationItem.title = @"歌手";
}
-(void)singerHandle
{
    [NetHandler getDataWithUrl:@"http://v1.ard.tj.itlily.com/ttpod?a=getnewttpod&id=46&app=ttpod&v=v8.0.1.2015091618&uid=&mid=iPhone7%2C1&f=f320&s=s310&imsi=&hid=&splus=9.0.2&active=1&net=2&openudid=b84e6c189538e7559391e944e7c89981cd053f82&idfa=8D62E513-F586-4517-8FE9-63192FBCEAEC&utdid=Viofi8%2BQvZADAKHoNwFdlYIU&alf=201200&bundle_id=com.ttpod.music&latitude=31.13004382084314&longtitude=121.2840346564585" completion:^(NSData *data) {
        self.singerListArr = [NSMutableArray array];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *arr = [dic objectForKeyedSubscript:@"data"];
        for (NSDictionary *dic in arr) {
            SingerCategory *list = [[SingerCategory alloc]init];
            [list setValuesForKeysWithDictionary:dic];
            [self.singerListArr addObject:list];
        }
        [self.collectionView reloadData];
    }];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.singerListArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SingerListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"singerCell" forIndexPath:indexPath];
    SingerCategory *list = self.singerListArr[indexPath.item];
    cell.name.text = list.title;
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",list.pic_url]] placeholderImage:nil];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SingerViewController *singerVC = [[SingerViewController alloc]init];
    SingerCategory *list = self.singerListArr[indexPath.item];
    singerVC.list = list;
    
    [self.navigationController pushViewController:singerVC animated:YES];
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
