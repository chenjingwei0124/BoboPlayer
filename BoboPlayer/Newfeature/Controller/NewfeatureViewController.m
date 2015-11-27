//
//  NewfeatureViewController.m
//  黑马微博
//
//  Created by 葛宏兵 on 15/11/14.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "NewfeatureViewController.h"
#import "PlayerViewController.h"
#define HWNewfeatureCount 4
#import "UMSocial.h"
@interface NewfeatureViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation NewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建scrolview
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    CGFloat scrollW = scrollView.frame.size.width;
    CGFloat scrollH = scrollView.frame.size.height;
    //添加到scrollview
    for (int i = 0; i < HWNewfeatureCount; i++) {
        UIImageView *imageV = [[ UIImageView alloc]init];
        imageV.width = scrollW;
        imageV.height = scrollH;
        imageV.y = 0;
        imageV.x = i*scrollW;
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageV.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageV];
        //如果是最后一个imgeV
        if (i == HWNewfeatureCount -1) {
            [self setupLastImageView:imageV];
        }
    }
    scrollView.contentSize = CGSizeMake(HWNewfeatureCount*scrollW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    //pageControl
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages =HWNewfeatureCount;
//    pageControl.width = 100;
//    pageControl.height = 50;
    pageControl.centerX = scrollW *0.5;
    pageControl.centerY = scrollH -50;

    pageControl.currentPageIndicatorTintColor = HWColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = HWColor(189, 189, 189);
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}
-(void)setupLastImageView:(UIImageView *)imageV
{
    //1,分享给大家
    UIButton *shareBtn = [[UIButton alloc]init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:(UIControlStateNormal)];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:(UIControlStateSelected)];
    [shareBtn setTitle:@"分享给大家" forState:(UIControlStateNormal)];
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    shareBtn.width = 120;
    shareBtn.height = 30;
    shareBtn.centerX = imageV.width*0.5;
    shareBtn.centerY = imageV.height *0.7;
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [shareBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:(UIControlEventTouchUpInside)];
    imageV.userInteractionEnabled = YES;
    [imageV addSubview:shareBtn];
    
    UIButton *startBtn = [[UIButton alloc]init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:(UIControlStateNormal)];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:(UIControlStateSelected)];
    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = imageV.width*0.5;
    startBtn.centerY = imageV.height *0.78;
    [startBtn setTitle:@"开始音乐" forState:(UIControlStateNormal)];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:(UIControlEventTouchUpInside)];
    [imageV addSubview:startBtn];
    
}
-(void)startClick
{
    //切换到tabController
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    PlayerViewController *playVC = [[PlayerViewController alloc]init];
    window.rootViewController = [[UINavigationController alloc]initWithRootViewController:playVC];
    
}
-(void)shareClick:(UIButton *)shaBtn
{
    //状态取反
    shaBtn.selected = !shaBtn.isSelected;
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56453de2e0f55a2147008741"
                                      shareText:@"波波音乐就是牛~~"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:@[UMShareToSina]
                                       delegate:nil];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGPoint offset = scrollView.contentOffset;
    double page = offset.x/scrollView.width;
    //四舍五入计算页码
    self.pageControl.currentPage = (int)(page +0.5);
//    self.pageControl.currentPage = page;
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
