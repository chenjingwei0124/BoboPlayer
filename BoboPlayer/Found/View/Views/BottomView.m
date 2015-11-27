//
//  BottomView.m
//  MyMusic
//
//  Created by sajyy on 15/11/6.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.playSlider = [[UISlider alloc]init];
//        [self addSubview:self.playSlider];
        
        self.previousMusic = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.previousMusic];
        
        self.pauseMusic = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.pauseMusic];
        
        self.nextMusic = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.nextMusic];
        
        self.timeLabel = [[UILabel alloc]init];
        [self addSubview:self.timeLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.playSlider.frame = CGRectMake(0, 0, self.bounds.size.width-50, 20);
    self.playSlider.tintColor = [UIColor blueColor];
    
    self.previousMusic.frame  = CGRectMake(self.bounds.size.height/2,self.playSlider.frame.origin.y + self.playSlider.bounds.size.height + 10, self.bounds.size.height / 2, self.bounds.size.height/2);
    [self.previousMusic setImage:[UIImage imageNamed:@"iconfont-stepbackward"] forState:(UIControlStateNormal)];
    
    self.pauseMusic.frame  = CGRectMake(self.bounds.size.width/2 - self.bounds.size.height/4,self.playSlider.frame.origin.y + self.playSlider.bounds.size.height + 10, self.bounds.size.height / 2, self.bounds.size.height/2);
    [self.pauseMusic setImage:[UIImage imageNamed:@"iconfont-stop-active"] forState:(UIControlStateNormal)];
    
    self.nextMusic.frame = CGRectMake(self.bounds.size.width - self.bounds.size.height, self.pauseMusic.frame.origin.y, self.bounds.size.height/2, self.bounds.size.height/2);
    [self.nextMusic setImage:[UIImage imageNamed:@"iconfont-stepforward"] forState:(UIControlStateNormal)];
    
    self.timeLabel.frame = CGRectMake(self.bounds.size.width- 50, 0, 50, 20);
    self.timeLabel.textColor = [UIColor whiteColor];
    self.timeLabel.backgroundColor = [UIColor blackColor];
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    self.timeLabel.alpha = 0.8;

}


@end
