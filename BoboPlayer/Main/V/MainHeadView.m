//
//  MainHeadView.m
//  UI_BoboPlayer
//
//  Created by lanou on 15/10/28.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MainHeadView.h"

@interface MainHeadView ()

@end

@implementation MainHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.setupB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.setupB.frame = CGRectMake(frame.size.width/30, frame.size.height/2, 20, 20);
        [self.setupB setBackgroundImage:[UIImage imageNamed:@"iconfont-caidan"] forState:(UIControlStateNormal)];
        self.setupB.titleLabel.text = @"setupB";
        [self addSubview:self.setupB];
        
        self.searchB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.searchB.frame = CGRectMake(frame.size.width - frame.size.width/30 - 20, self.setupB.frame.origin.y, 20, 20);
        [self.searchB setBackgroundImage:[UIImage imageNamed:@"iconfont-sousuo"] forState:(UIControlStateNormal)];
        self.searchB.titleLabel.text = @"searchB";
        [self addSubview:self.searchB];
        
        self.localB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.localB.titleLabel.font = [UIFont systemFontOfSize:17];
        self.localB.frame = CGRectMake(frame.size.width/4, frame.size.height/2, 40, 20);
        [self.localB setTitle:@"本地" forState:(UIControlStateNormal)];
        [self addSubview:self.localB];
        
        self.recommendB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.recommendB.titleLabel.font = [UIFont systemFontOfSize:17];
        self.recommendB.frame = CGRectMake(frame.size.width/2 - 20, frame.size.height/2, 40, 20);
        [self.recommendB setTitle:@"推荐" forState:(UIControlStateNormal)];
        [self addSubview:self.recommendB];

        self.foundB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.foundB.titleLabel.font = [UIFont systemFontOfSize:17];
        self.foundB.frame = CGRectMake(frame.size.width*3/4 - self.recommendB.bounds.size.width, frame.size.height/2, 40, 20);
        [self.foundB setTitle:@"发现" forState:(UIControlStateNormal)];
        [self addSubview:self.foundB];

        [self.localB setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [self.recommendB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [self.foundB setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
