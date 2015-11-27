
//
//  PopHideView.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "PopHideView.h"

@implementation PopHideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.popHidBlock();
}
@end
