//
//  ScrollView.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "ScrollView.h"
#import "Poster.h"
#import "UIImageView+WebCache.h"
@interface ScrollView()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *page;
@property(nonatomic,strong)UIImageView *imageV;

@property (nonatomic,strong)NSArray *arr;


@end
@implementation ScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        self.scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, width, height))];
        self.scrollView.contentSize = CGSizeMake(self.posterArr.count+1*width, height);
        //        self.scrollView.contentSize = CGSizeMake(6*width, height);
        self.scrollView.contentOffset = CGPointMake(width, 0);
        self.scrollView.scrollEnabled = YES;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.bounces = YES;
        //显示水平滚动条
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
        [self addSubview:self.scrollView];
        
        //页面控制
        self.page = [[UIPageControl alloc]initWithFrame:(CGRectMake(80, 170, 200, 40))];
        self.page.numberOfPages = 5;
        self.page.currentPage = 0;
        [self.page addTarget:self action:@selector(changeScroll:) forControlEvents:(UIControlEventValueChanged)];
        [self addSubview:self.page];
        
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(autoPlay:) userInfo:nil repeats:YES];
    }
    return self;
}
-(void)changeScroll:(UIPageControl *)pageControl
{
    NSInteger currentPage = pageControl.currentPage;
    CGFloat width = self.frame.size.width;
    [self.scrollView setContentOffset:(CGPointMake((currentPage+1)*width, 0)) animated:YES];
}
-(void)autoPlay:(NSTimer *)timer
{
    CGFloat width = self.frame.size.width;
    //scrollView偏移量
    CGPoint offset = self.scrollView.contentOffset;
    NSInteger page = offset.x/width;
//     if (offset.x +width == 5*width)
    if (offset.x +width == self.posterArr.count*width) {
        //切到第一张
        [self.scrollView setContentOffset:(CGPointMake(0, offset.y)) animated:NO];
        self.page.currentPage = self.page.numberOfPages-1;
    }else
    {
        [self.scrollView setContentOffset:(CGPointMake(offset.x+width, offset.y)) animated:YES];
        self.page.currentPage = page;
    }

    
}
-(void)setPosterArr:(NSMutableArray *)posterArr
{
    _posterArr = posterArr;
    if (posterArr.count == 5) {
        self.arr = @[[posterArr[4]picUrl],[posterArr[0]picUrl],[posterArr[1]picUrl],[posterArr[2]picUrl],[posterArr[3]picUrl],[posterArr[4]picUrl]];
        
        if (self.arr.count != 0) {
            CGFloat width = self.bounds.size.width;
            CGFloat height = self.bounds.size.height;
            for (int i = 0; i < 6; i++) {
                CGFloat offSetX = width * i;
                self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(offSetX, 0, width, height))];
                [self.scrollView addSubview:self.imageV];
                [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.arr[i]]] placeholderImage:nil];
            }
        }
    }
    if (posterArr.count == 4) {
        self.arr = @[[posterArr[3]picUrl],[posterArr[0]picUrl],[posterArr[1]picUrl],[posterArr[2]picUrl],[posterArr[3]picUrl]];
        
        if (self.arr.count != 0) {
            CGFloat width = self.bounds.size.width;
            CGFloat height = self.bounds.size.height;
            for (int i = 0; i < 5; i++) {
                CGFloat offSetX = width * i;
                self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(offSetX, 0, width, height))];
                [self.scrollView addSubview:self.imageV];
                [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.arr[i]]] placeholderImage:nil];
            }
        }
    }
   
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = self.bounds.size.width;
//    if (self.scrollView.contentOffset.x > 5 *width)
    if (self.scrollView.contentOffset.x > self.posterArr.count *width) {
        self.scrollView.contentOffset = CGPointMake(0, 0);
    }else if (self.scrollView.contentOffset.x <0)
    {
//        self.scrollView.contentOffset = CGPointMake(5 *width, 0);
        self.scrollView.contentOffset = CGPointMake(self.posterArr.count *width, 0);
    }
}
@end
