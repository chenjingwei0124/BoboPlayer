//
//  MainFootView.m
//  ChoicePlayer
//
//  Created by lanou on 15/10/27.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MainFootView.h"

@interface MainFootView ()

@end

@implementation MainFootView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.progressV = [[UIProgressView alloc] initWithFrame:(CGRectMake(0, 0, self.bounds.size.width, 10))];
        [self.progressV setProgressViewStyle:(UIProgressViewStyleDefault)];
        self.progressV.progressTintColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
        self.progressV.trackTintColor = [UIColor grayColor];
        self.progressV.progress = 0;
        self.progressV.backgroundColor = [UIColor redColor];
        [self addSubview:self.progressV];
        
        self.footImageV = [[UIImageView alloc] initWithFrame:(CGRectMake(self.bounds.size.width/30, self.bounds.size.height/8 + self.progressV.bounds.size.height /2, self.bounds.size.height*6/8, self.bounds.size.height*6/8))];
        self.footImageV.layer.cornerRadius = self.bounds.size.height*3/8;
        self.footImageV.layer.masksToBounds = YES;
        self.footImageV.backgroundColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
        self.footImageV.image = [UIImage imageNamed:@"iconfont-yinleren"];
        [self addSubview:self.footImageV];
        
        self.footnameL = [[UILabel alloc] initWithFrame:(CGRectMake(self.footImageV.bounds.size.width + self.bounds.size.width/30 * 2, self.footImageV.frame.origin.y, self.bounds.size.width/3, self.footImageV.bounds.size.width /2))];
        self.footnameL.text = @"动听音乐";
        self.footnameL.font = [UIFont systemFontOfSize:15];
        //    self.footnameL.backgroundColor = [UIColor redColor];
        self.footnameL.textColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
        [self addSubview:self.footnameL];
        
        self.footauthorL = [[UILabel alloc] initWithFrame:(CGRectMake(self.footnameL.frame.origin.x, self.footnameL.frame.origin.y + self.footnameL.bounds.size.height, self.footnameL.bounds.size.width, self.footnameL.bounds.size.height))];
        self.footauthorL.text = @"**";
        self.footauthorL.textColor = [UIColor colorWithRed:53/225.0 green:184/225.0 blue:105/225.0 alpha:1];
        self.footauthorL.font = [UIFont systemFontOfSize:12];
        [self addSubview:self.footauthorL];
        
        self.footplayerB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.footplayerB.frame = CGRectMake(self.footnameL.frame.origin.x + self.footnameL.bounds.size.width + self.bounds.size.width/30 * 2, self.footnameL.frame.origin.y, self.bounds.size.height*5/8, self.bounds.size.height*5/8);
        CGPoint cenPlayerB = CGPointMake(self.footplayerB.center.x, self.footImageV.center.y);
        self.footplayerB.center = cenPlayerB;
        [self.footplayerB setBackgroundImage:[UIImage imageNamed:@"iconfont-play-o"] forState:(UIControlStateNormal)];
        [self addSubview:self.footplayerB];
        
        self.footnextB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.footnextB.frame = CGRectMake(self.footplayerB.frame.origin.x + self.footplayerB.bounds.size.width + self.bounds.size.width/30 * 1.5, self.footplayerB.frame.origin.y, self.bounds.size.height*2.5/8, self.bounds.size.height*2.5/8);
        CGPoint cenNextB = CGPointMake(self.footnextB.center.x, self.footImageV.center.y);
        self.footnextB.center = cenNextB;
        [self.footnextB setBackgroundImage:[UIImage imageNamed:@"iconfont-xiayishou"] forState:(UIControlStateNormal)];
        self.footnextB.layer.cornerRadius = self.bounds.size.height/8;
        [self addSubview:self.footnextB];
        
        self.footlistB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.footlistB.frame = CGRectMake(self.bounds.size.width - self.bounds.size.width/30 - self.bounds.size.height*3/8, self.footnextB.frame.origin.y, self.bounds.size.height*3/8, self.bounds.size.height*3/8);
        CGPoint cenListB = CGPointMake(self.footlistB.center.x, self.footImageV.center.y);
        self.footlistB.center = cenListB;
        [self.footlistB setBackgroundImage:[UIImage imageNamed:@"iconfont-yinlezhuanti"] forState:(UIControlStateNormal)];
        [self addSubview:self.footlistB];

    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.footBlock();
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
