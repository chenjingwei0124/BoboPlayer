//
//  UserInfoViewController.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.headV = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, 64))];
    self.headV.backgroundColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
    [self.view addSubview:self.headV];
    
    self.backB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.backB.frame = CGRectMake(self.view.bounds.size.width/30, self.headV.bounds.size.height/2, 50, 30);
    [self.backB setTitle:@"取消" forState:(UIControlStateNormal)];
    [self.backB addTarget:self action:@selector(backBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.backB];
    
    self.searchB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.searchB.frame = CGRectMake(self.view.bounds.size.width - self.view.bounds.size.width/30 - 50, self.headV.bounds.size.height/2, 50, 30);
    [self.searchB setTitle:@"注销" forState:(UIControlStateNormal)];
    [self.searchB addTarget:self action:@selector(searchBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:self.searchB];
    
    
    UILabel *titlelabel = [[UILabel alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 2 - 50, self.headV.frame.size.height / 2 - 30 / 2 + 10, 100, 40))];
    titlelabel.text = @"用户资料";
    titlelabel.font = [UIFont systemFontOfSize:20];
    titlelabel.textAlignment = YES;
    titlelabel.textColor = [UIColor whiteColor];
    
    [self.headV addSubview:titlelabel];
    
    
    self.imageView = [[UIImageView alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 5 , self.view.frame.size.height / 8, self.view.frame.size.width / 5 * 3, self.view.frame.size.width / 5 * 3))];
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.layer.cornerRadius = self.view.frame.size.width / 5 * 3 / 2;
    self.imageView.layer.masksToBounds = YES;
    
    
    [self.view addSubview:self.imageView];
    
    
    
}

- (void)backBAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)searchBAction:(UIButton *)button{


    self.reload();
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogin"];
    [self.navigationController popViewControllerAnimated:YES];
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
