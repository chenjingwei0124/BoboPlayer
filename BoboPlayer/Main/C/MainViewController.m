//
//  MainViewController.m
//  UI_BoboPlayer
//
//  Created by lanou on 15/10/28.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MainViewController.h"
#import "MainHeadView.h"

#import "MusicListController.h"
#import "MineViewController.h"
#import "SearchViewController.h"
#import "FindViewController.h"
#import "SDImageCache.h"

@interface MainViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)MainHeadView *headV;
@property (nonatomic, strong)UIView *headUnderV;

@property (nonatomic, strong)UIScrollView *scrollV;
@property (nonatomic, strong)FindViewController *recommendVC;
@property (nonatomic, strong)MineViewController *localVC;
@property (nonatomic, strong)MusicListController *foundVC;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.hidden = YES;
    
    //headView
    self.headV = [[MainHeadView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.navigationController.navigationBar.bounds.size.height + 20))];
    self.headV.backgroundColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
    [self.headV.setupB addTarget:self action:@selector(headVButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.headV.searchB addTarget:self action:@selector(headVButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.headV.localB addTarget:self action:@selector(headVButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.headV.recommendB addTarget:self action:@selector(headVButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.headV.foundB addTarget:self action:@selector(headVButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
     [self.headV.setupB addTarget:self action:@selector(clearClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.headV];
    
    //headUnderV
    self.headUnderV = [[UIView alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width/4 - 10, self.headV.bounds.size.height - 4, 60, 4))];
     self.headUnderV.backgroundColor = [UIColor whiteColor];
     self.headUnderV.layer.cornerRadius = 3;
     [self.headV addSubview:self.headUnderV];
    
    //scrollView
    self.scrollV = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, self.headV.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - self.headV.bounds.size.height))];
    self.scrollV.contentSize = CGSizeMake(self.view.bounds.size.width *3, self.scrollV.bounds.size.height);
    self.scrollV.pagingEnabled = YES;
    self.scrollV.scrollEnabled = YES;
    self.scrollV.bounces = NO;
    self.scrollV.showsHorizontalScrollIndicator = NO;
    self.scrollV.showsVerticalScrollIndicator = NO;
    self.scrollV.delegate = self;
    [self.view addSubview:self.scrollV];
    
    //contorller
    self.localVC = [[MineViewController alloc] init];
    [self addChildViewController:self.localVC];
    UIView *localV = self.localVC.view;
    localV.frame = CGRectOffset(self.scrollV.bounds, 0, 0);
    [self.scrollV addSubview:localV];
    
    self.recommendVC = [[FindViewController alloc] init];
    [self addChildViewController:self.recommendVC];
    UIView *recommendV = self.recommendVC.view;
    recommendV.frame = CGRectOffset(self.scrollV.bounds, self.scrollV.bounds.size.width, 0);
    [self.scrollV addSubview:recommendV];
    
    self.foundVC = [[MusicListController alloc] init];
    [self addChildViewController:self.foundVC];
    UIView *foundV = self.foundVC.view;
    foundV.frame = CGRectOffset(self.scrollV.bounds, self.scrollV.bounds.size.width * 2, 0);
    [self.scrollV addSubview:foundV];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(diantaiHR) name:@"diantaiHR" object:nil];
    
}

-(void)clearClick
{
    //    NSLog(@"清除混存");
    //    [[SDImageCache sharedImageCache] clearMemory];//可有可无
    float tmpSize = [[SDImageCache sharedImageCache]getSize];
    NSString *clearCacheName = tmpSize >= 1 ? [NSString stringWithFormat:@"清理缓存(%.2fM)",tmpSize/1024/1024] : [NSString stringWithFormat:@"清理缓存(%.2fK)",tmpSize/1024/1024];
    [[SDImageCache sharedImageCache] clearDisk];
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"%@",clearCacheName ]preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action =[UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:^{
        nil;
    }];
}

-(void)diantaiHR{
    self.scrollV.contentOffset = CGPointMake(self.view.bounds.size.width * 2, 0);
    
}


- (void)headVButtonAction:(UIButton *)button{
//    NSLog(@"%@", button.titleLabel.text);
    if ([button.titleLabel.text isEqualToString:@"setupB"]) {
        
    }
    if ([button.titleLabel.text isEqualToString:@"searchB"]) {
        SearchViewController *searchVC = [[SearchViewController alloc] init];
        [self.navigationController pushViewController:searchVC animated:YES];
    }
    if ([button.titleLabel.text isEqualToString:@"本地"]) {
        self.scrollV.contentOffset = CGPointMake(0, 0);
    }
    if ([button.titleLabel.text isEqualToString:@"推荐"]) {
        self.scrollV.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
    }
    if ([button.titleLabel.text isEqualToString:@"发现"]) {
        self.scrollV.contentOffset = CGPointMake(self.view.bounds.size.width * 2, 0);
    }
    [self scrollViewDidEndDecelerating:self.scrollV];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.headUnderV.frame = CGRectMake(self.view.bounds.size.width/4 - 10 + scrollView.contentOffset.x * ((self.view.bounds.size.width/4 - 20)/self.view.bounds.size.width), self.headV.bounds.size.height - 4, 60, 4);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        [self.headV.localB setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [self.headV.recommendB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [self.headV.foundB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
         [[NSNotificationCenter defaultCenter] postNotificationName:@"musicPlayerShow" object:@"YES"];
    }
    if (scrollView.contentOffset.x == self.view.bounds.size.width) {
        [self.headV.localB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [self.headV.recommendB setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [self.headV.foundB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
         [[NSNotificationCenter defaultCenter] postNotificationName:@"musicPlayerShow" object:@"YES"];
    }
    if (scrollView.contentOffset.x == self.view.bounds.size.width * 2) {
        [self.headV.localB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [self.headV.recommendB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [self.headV.foundB setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"musicPlayerShow" object:@"NO"];
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
