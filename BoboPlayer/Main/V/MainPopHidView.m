//
//  MainPopHidView.m
//  ChoicePlayer
//
//  Created by lanou on 15/10/27.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MainPopHidView.h"

@interface MainPopHidView()

@end

@implementation MainPopHidView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.popHidBlock();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
