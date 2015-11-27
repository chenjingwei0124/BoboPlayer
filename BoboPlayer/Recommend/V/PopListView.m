//
//  PopListView.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "PopListView.h"

@implementation PopListView

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
        self.title = [[UILabel alloc]initWithFrame:(CGRectMake(0, 10, frame.size.width, 30))];
        [self addSubview:self.title];
        self.title.textAlignment = NSTextAlignmentCenter;
        
        self.like = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.like.frame = CGRectMake(20, 50, 30, 30);
        [self.like setImage:[UIImage imageNamed:@"iconfont-aixin"] forState:(UIControlStateNormal)];
        [self addSubview:self.like];
        
        UILabel *lable1 = [[UILabel alloc]initWithFrame:(CGRectMake(20, self.like.frame.origin.y+self.like.frame.size.height+5, 50, 30))];
        lable1.text = @"收藏";
        lable1.textColor = [UIColor whiteColor];
        
        [self addSubview:lable1];
        
        self.add = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.add.frame = CGRectMake(self.like.frame.origin.x+self.like.frame.size.width+50, 50, 30, 30);
        [self.add setImage:[UIImage imageNamed:@"iconfont-jiahao"] forState:(UIControlStateNormal)];
        [self addSubview:self.add];
        
        UILabel *lable2 = [[UILabel alloc]initWithFrame:(CGRectMake(self.add.frame.origin.x, lable1.frame.origin.y, 100, 30))];
        lable2.text = @"加入歌单";
        lable2.textColor = [UIColor whiteColor];
        [self addSubview:lable2];
        
        self.btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn.frame = CGRectMake(self.frame.size.width/2-25, 200, 50, 30);
        [self.btn setTitle:@"关闭" forState:(UIControlStateNormal)];
        [self addSubview:self.btn];
        
        
        
    }
    return self;
}

@end
