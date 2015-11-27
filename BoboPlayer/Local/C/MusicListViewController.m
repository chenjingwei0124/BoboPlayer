//
//  MusicListViewController.m
//  MPlayer
//
//  Created by SUN on 15/10/29.
//  Copyright © 2015年 孙海睿. All rights reserved.
//

#import "MusicListViewController.h"

@interface MusicListViewController ()<UIScrollViewDelegate>
@property(nonatomic,retain) UIView *headUnderView;
@property(nonatomic,retain) UIScrollView *scrollV;

@property (nonatomic, strong)UIButton *localB;
@property (nonatomic, strong)UIButton *recommendB;
@end

@implementation MusicListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.hidden = YES;
    
    self.localB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.localB.titleLabel.font = [UIFont systemFontOfSize:17];
    self.localB.frame = CGRectMake(self.view.bounds.size.width / 2 - 60, self.headV.bounds.size.height/2, 40, 20);
    [self.headV addSubview:self.localB];
    
    self.recommendB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.recommendB.titleLabel.font = [UIFont systemFontOfSize:17];
    self.recommendB.frame = CGRectMake(self.view.bounds.size.width / 2 + 20, self.headV.bounds.size.height/2, 40, 20);
    [self.headV addSubview:self.recommendB];
    
    [self.localB setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.recommendB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    
    [self.localB addTarget:self action:@selector(headVButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.recommendB addTarget:self action:@selector(headVButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.localB setTitle:@"单曲" forState:(UIControlStateNormal)];
    [self.recommendB setTitle:@"歌手" forState:(UIControlStateNormal)];

    //那个可爱的白色的杠杠~~
    self.headUnderView = [[UIView alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width / 2 - 70, self.headV.bounds.size.height - 4, 60, 4))];
    self.headUnderView.backgroundColor = [UIColor whiteColor];
    self.headUnderView.layer.cornerRadius = 3;
    [self.headV addSubview:self.headUnderView];
    
    
    //scrollView
    self.scrollV = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, self.headV.frame.size.height, self.view.bounds.size.width, self.view.bounds.size.height - self.headV.bounds.size.height))];
    self.scrollV.contentSize = CGSizeMake(self.view.bounds.size.width * 2, self.scrollV.bounds.size.height);
    self.scrollV.pagingEnabled = YES;
    self.scrollV.scrollEnabled = YES;
    self.scrollV.bounces = NO;
    self.scrollV.showsHorizontalScrollIndicator = NO;
    self.scrollV.showsVerticalScrollIndicator = NO;
    self.scrollV.delegate = self;
    self.scrollV.backgroundColor = [UIColor redColor];

    [self.view addSubview:self.scrollV];
    
    
    UITableView *tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.scrollV.frame.size.width, self.scrollV.frame.size.height - self.headV.bounds.size.height)];
    tableView1.backgroundColor = [UIColor redColor];
    [self.scrollV addSubview:tableView1];
    
    UITableView *tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(self.scrollV.frame.size.width, 0, self.scrollV.frame.size.width, self.scrollV.frame.size.height - self.headV.bounds.size.height)];
    tableView2.backgroundColor = [UIColor blueColor];
    [self.scrollV addSubview:tableView2];
    

}

- (void)headVButtonAction:(UIButton *)button{

    if ([button.titleLabel.text isEqualToString:@"全部"]) {
        self.scrollV.contentOffset = CGPointMake(0, 0);
    }
    if ([button.titleLabel.text isEqualToString:@"本地"]) {
        self.scrollV.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
    }

    [self scrollViewDidEndDecelerating:self.scrollV];
}

//改变白色小杠杠的位置....
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.headUnderView.frame = CGRectMake(self.view.bounds.size.width/2 - 70 + scrollView.contentOffset.x * ((80)/self.view.bounds.size.width), self.headV.bounds.size.height - 4, 60, 4);
    
//    if (scrollView.contentOffset.x == 0) {
//        self.headUnderView.frame = CGRectMake(self.view.frame.size.width / 2 - 70 , self.headV.bounds.size.height - 4, 60, 4);
//    }
//    if (scrollView.contentOffset.x == self.view.frame.size.width) {
//        self.headUnderView.frame = CGRectMake(self.view.frame.size.width / 2 + 10, self.headV.bounds.size.height - 4, 60, 4);
//    }
    
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        [self.localB setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [self.recommendB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];

    }
    if (scrollView.contentOffset.x == self.view.bounds.size.width) {
        [self.localB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [self.recommendB setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];

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
