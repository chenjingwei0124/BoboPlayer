//
//  SearchPopView.m
//  BoboPlayer
//
//  Created by lanou on 15/11/4.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SearchPopView.h"

@implementation SearchPopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.searchPopBlock();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
