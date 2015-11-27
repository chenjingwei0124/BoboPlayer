//
//  PlayerView.m
//  BoboPlayer
//
//  Created by lanou on 15/10/31.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "PlayerView.h"
#import "UIImage+BlurGlass.h"
#import "PlayerDateil.h"
#import "SongData.h"

@interface PlayerView ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollV;
@property (nonatomic, strong)UIButton *moreB;

@property (nonatomic, strong)UIView *playImageV;
@property (nonatomic, strong)UIPageControl *pageCV;

@property (nonatomic, strong)PlayerDateil *playDateilV;
@end

@implementation PlayerView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor grayColor];
        self.backImageV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height))];
        
        UIImage *image = [UIImage imageNamed:@"beijing.jpg"];
        self.backImageV.image = [image imgWithLightAlpha:0.1 radius:16 colorSaturationFactor:0.9];
        [self addSubview:self.backImageV];
        
        self.backB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.backB.frame = CGRectMake(frame.size.width/30, 32, 20, 20);
        [self.backB setBackgroundImage:[UIImage imageNamed:@"iconfont-jiantou"] forState:(UIControlStateNormal)];
        [self addSubview:self.backB];
        
        self.moreB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.moreB.frame = CGRectMake(frame.size.width - frame.size.width/30 - 20, 32, 20, 20);
        [self.moreB addTarget:self action:@selector(moreBAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.moreB setBackgroundImage:[UIImage imageNamed:@"iconfont-gengduo1"] forState:(UIControlStateNormal)];
        [self addSubview:self.moreB];

        self.titleL = [[UILabel alloc] initWithFrame:(CGRectMake(frame.size.width*3/30 + 20, 32, frame.size.width - (frame.size.width*3/30 + 20)*2, 20))];
        self.titleL.font = [UIFont systemFontOfSize:17];
        self.titleL.textColor = [UIColor whiteColor];
        self.titleL.textAlignment = NSTextAlignmentCenter;
        self.titleL.text = @"动听音乐";
        [self addSubview:self.titleL];
        
        //playImageV
        self.playImageV = [[UIView alloc] initWithFrame:(CGRectMake(0, 64 , frame.size.width, frame.size.height*3/4 - 64))];
        self.playImageV.backgroundColor = [UIColor clearColor];
        [self addSubview:self.playImageV];
        [self addPlayerImageV];
        
        //scrollV
        self.scrollV = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 64 + self.titleL.bounds.size.height, frame.size.width, frame.size.height*3/4 - 64 - self.titleL.bounds.size.height))];
        self.scrollV.contentSize = CGSizeMake(frame.size.width * 2, 0);
        self.scrollV.contentOffset = CGPointMake(0, 0);
        self.scrollV.pagingEnabled = YES;
        self.scrollV.delegate = self;
        self.scrollV.alwaysBounceHorizontal = YES;
        self.scrollV.alwaysBounceVertical = NO;
        self.scrollV.showsVerticalScrollIndicator = NO;
        self.scrollV.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollV];
        
        self.playDateilV = [[PlayerDateil alloc] initWithFrame:(CGRectMake(self.scrollV.bounds.size.width, 0, self.scrollV.bounds.size.width, self.scrollV.bounds.size.height))];
        [self.scrollV addSubview:self.playDateilV];
        
        
        //pageCV
        self.pageCV = [[UIPageControl alloc] initWithFrame:(CGRectMake(0, self.playImageV.frame.origin.y + self.playImageV.bounds.size.height - 30, self.playImageV.bounds.size.width, 20))];
        self.pageCV.numberOfPages = 2;
        self.pageCV.currentPage = 0;
        self.pageCV.currentPageIndicatorTintColor = [UIColor whiteColor];
        self.pageCV.pageIndicatorTintColor = [UIColor grayColor];
        [self addSubview:self.pageCV];
        
        self.collectB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.collectB.frame = CGRectMake(frame.size.width/2 - 15, self.playImageV.frame.origin.y + self.playImageV.bounds.size.height, 30, 30);
        [self.collectB setBackgroundImage:[UIImage imageNamed:@"iconfont-shoucang"] forState:(UIControlStateNormal)];
        [self addSubview:self.collectB];
        
        self.orderB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.orderB.frame = CGRectMake(frame.size.width/2 - 45 - frame.size.width/15, self.playImageV.frame.origin.y + self.playImageV.bounds.size.height, 30, 30);
         self.orderB.titleLabel.text = @"cycleplay";
        [self.orderB setBackgroundImage:[UIImage imageNamed:@"iconfont-shunxuxunhuan"] forState:(UIControlStateNormal)];
        [self addSubview:self.orderB];
        
        self.playListB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.playListB.frame = CGRectMake(frame.size.width/2 + 15 + frame.size.width/15, self.playImageV.frame.origin.y + self.playImageV.bounds.size.height, 30, 30);
        [self.playListB setBackgroundImage:[UIImage imageNamed:@"iconfont-yinlezhuanti"] forState:(UIControlStateNormal)];
        [self addSubview:self.playListB];
        
        self.timeingL = [[UILabel alloc] initWithFrame:(CGRectMake(frame.size.width/15, self.collectB.frame.origin.y + self.collectB.bounds.size.height *1.5 , 50, 20))];
        self.timeingL.text = @"00:00";
        self.timeingL.textColor = [UIColor whiteColor];
        self.timeingL.textAlignment = NSTextAlignmentCenter;
        self.timeingL.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.timeingL];
        
        self.totalTimeL = [[UILabel alloc] initWithFrame:(CGRectMake(frame.size.width - frame.size.width/15 - 50, self.collectB.frame.origin.y + self.collectB.bounds.size.height *1.5 , 50, 20))];
        self.totalTimeL.text = @"00:00";
        self.totalTimeL.textColor = [UIColor whiteColor];
        self.totalTimeL.textAlignment = NSTextAlignmentCenter;
        self.totalTimeL.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.totalTimeL];
        
        self.sliderV = [[UISlider alloc] initWithFrame:(CGRectMake(0, self.timeingL.frame.origin.y, self.totalTimeL.frame.origin.x - self.timeingL.frame.origin.x - self.timeingL.bounds.size.width * 1.5, 20))];
        self.sliderV.minimumTrackTintColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
        self.sliderV.maximumTrackTintColor = [UIColor whiteColor];
        [self.sliderV setThumbImage:[UIImage imageNamed:@"iconfont-point"] forState:(UIControlStateNormal)];
        self.sliderV.minimumValue = 0.0;
        CGPoint cenSliderV = CGPointMake(frame.size.width/2, self.sliderV.center.y);
        self.sliderV.center = cenSliderV;
        [self addSubview:self.sliderV];
        
        self.playB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.playB.frame = CGRectMake(frame.size.width/2 - (frame.size.height - (self.sliderV.frame.origin.y + self.sliderV.bounds.size.height))/3, self.sliderV.frame.origin.y + self.sliderV.bounds.size.height, (frame.size.height - (self.sliderV.frame.origin.y + self.sliderV.bounds.size.height))/1.5, (frame.size.height - (self.sliderV.frame.origin.y + self.sliderV.bounds.size.height))/1.5);
        [self.playB setBackgroundImage:[UIImage imageNamed:@"iconfont-play-o"] forState:(UIControlStateNormal)];
        [self addSubview:self.playB];
        
        self.upOneB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.upOneB.frame = CGRectMake(self.playB.frame.origin.x - self.playB.bounds.size.width, 0, self.playB.bounds.size.width/2, self.playB.bounds.size.width/2);
        CGPoint cenUpOne = CGPointMake(self.upOneB.center.x, self.playB.center.y);
        self.upOneB.center = cenUpOne;
        [self.upOneB setBackgroundImage:[UIImage imageNamed:@"iconfont-shangyishou_p"] forState:(UIControlStateNormal)];
        [self addSubview:self.upOneB];
        
        
        self.nextOneB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.nextOneB.frame = CGRectMake(self.playB.frame.origin.x + self.playB.bounds.size.width*1.5, 0, self.playB.bounds.size.width/2, self.playB.bounds.size.width/2);
        CGPoint cenNextOne = CGPointMake(self.nextOneB.center.x, self.playB.center.y);
        self.nextOneB.center = cenNextOne;
        [self.nextOneB setBackgroundImage:[UIImage imageNamed:@"iconfont-xiayishou_p"] forState:(UIControlStateNormal)];
        [self addSubview:self.nextOneB];
        
    }
    return self;
}

- (void)addPlayerImageV{
    self.singerL = [[UILabel alloc] initWithFrame:(CGRectMake(self.titleL.frame.origin.x, 0, self.titleL.bounds.size.width, self.titleL.bounds.size.height))];
    self.singerL.textColor = [UIColor whiteColor];
    self.singerL.textAlignment = NSTextAlignmentCenter;
    self.singerL.font = [UIFont systemFontOfSize:13];
    self.singerL.text = @"-- ** --";
    [self.playImageV addSubview:self.singerL];
    
    self.singerV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, self.singerL.frame.origin.y + self.singerL.bounds.size.height * 2, self.playImageV.bounds.size.height / 1.8, self.playImageV.bounds.size.height / 1.8))];
    CGPoint cen = CGPointMake(self.playImageV.bounds.size.width/2, self.playImageV.bounds.size.height /2.2);
    self.singerV.center = cen;
    self.singerV.layer.cornerRadius = self.singerV.bounds.size.width/2;
    self.singerV.layer.masksToBounds = YES;
    self.singerV.image = [UIImage imageNamed:@"beijing.jpg"];
    self.singerV.backgroundColor = [UIColor redColor];
    [self.playImageV addSubview:self.singerV];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGPoint offset = scrollView.contentOffset;
    self.playImageV.alpha = 1 - fabs(offset.x)/self.bounds.size.width;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    NSUInteger page = offset.x / self.bounds.size.width;
    self.pageCV.currentPage = page;
}

- (void)moreBAction:(UIButton *)button{
    NSLog(@"更多");
}

- (void)setSongData:(SongData *)songData{
    _songData = songData;
    self.playDateilV.songData = self.songData;
    
    if ([songData.isCollect isEqualToString:@"1"]) {
        [self.collectB setBackgroundImage:[UIImage imageNamed:@"iconfont-shoucanged"] forState:(UIControlStateNormal)];
        self.collectB.titleLabel.text = @"YES";
    }else{
        [self.collectB setBackgroundImage:[UIImage imageNamed:@"iconfont-shoucang"] forState:(UIControlStateNormal)];
        self.collectB.titleLabel.text = @"NO";
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
