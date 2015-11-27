//
//  ButtonDetailCell.m
//  MyMusic
//
//  Created by sajyy on 15/10/31.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "ButtonDetailCell.h"
#import "UIColor+AddColor.h"

@implementation ButtonDetailCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:self.button];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.button.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
    self.button.backgroundColor = [UIColor lightGrayColor] ;
    self.button.layer.cornerRadius = self.bounds.size.width/3;
    self.button.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.button.layer.borderWidth = 5;
}

@end
