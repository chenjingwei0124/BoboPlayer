//
//  SingerListCollectionViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerListCollectionViewCell.h"

@implementation SingerListCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height-20))];
        [self.contentView addSubview:self.imageV];
        
        
        self.name = [[ UILabel alloc]initWithFrame:(CGRectMake(0, self.imageV.frame.size.height, frame.size.width, 20))];
        self.name.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.name];
    }
    return self;
}
@end
