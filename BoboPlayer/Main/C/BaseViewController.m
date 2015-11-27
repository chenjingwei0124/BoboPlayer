//
//  BaseViewController.m
//  UI_BoboPlayer
//
//  Created by lanou on 15/10/28.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "BaseViewController.h"
#import "SearchViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headV = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, 64))];
    self.headV.backgroundColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
    [self.view addSubview:self.headV];
    
    self.backB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.backB.frame = CGRectMake(self.view.bounds.size.width/30, self.headV.bounds.size.height/2, 20, 20);
    [self.backB setBackgroundImage:[UIImage imageNamed:@"iconfont-fanhui"] forState:(UIControlStateNormal)];
    [self.backB addTarget:self action:@selector(backBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.backB];
    
    self.searchB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.searchB.frame = CGRectMake(self.view.bounds.size.width - self.view.bounds.size.width/30 - 20, self.headV.bounds.size.height/2, 20, 20);
    [self.searchB addTarget:self action:@selector(searchBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.searchB setBackgroundImage:[UIImage imageNamed:@"iconfont-sousuo"] forState:(UIControlStateNormal)];
    [self.view addSubview:self.searchB];
    
    self.baseTitleL = [[UILabel alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width/4, self.headV.bounds.size.height/2, self.view.bounds.size.width/2, 20))];
    self.baseTitleL.textColor = [UIColor whiteColor];
    self.baseTitleL.textAlignment = NSTextAlignmentCenter;
    self.baseTitleL.font = [UIFont systemFontOfSize:16];
    [self.headV addSubview:self.baseTitleL];
}

- (void)backBAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)searchBAction:(UIButton *)button{
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
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
