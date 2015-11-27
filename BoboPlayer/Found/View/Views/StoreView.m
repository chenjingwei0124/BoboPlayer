//
//  StoreView.m
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import "StoreView.h"

@implementation StoreView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.pictView = [[UIImageView alloc]init];
        [self addSubview:self.pictView];
        
        self.nameLabel = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.nameLabel];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.pictView.frame = CGRectMake(self.bounds.size.width/8, self.bounds.size.height/8, self.bounds.size.width/5, self.bounds.size.width/5);
//    self.pictView.backgroundColor = [UIColor blueColor];
    
    self.nameLabel.frame = CGRectMake(self.pictView.frame.origin.x + self.pictView.bounds.size.width + 10, self.pictView.frame.origin.y, self.bounds.size.width/2, self.bounds.size.width/5);
//    self.nameLabel.backgroundColor = [UIColor blueColor];
    self.nameLabel.tintColor = [UIColor whiteColor];
}


@end
