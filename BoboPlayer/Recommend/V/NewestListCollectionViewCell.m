//
//  NewestListCollectionViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "NewestListCollectionViewCell.h"

@implementation NewestListCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height-40))];
        [self.contentView addSubview:self.imageV];
        
        self.name = [[ UILabel alloc]initWithFrame:(CGRectMake(0, self.imageV.frame.size.height, frame.size.width, 25))];
//        self.name.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.name];
        
        self.singer = [[UILabel alloc]initWithFrame:(CGRectMake(0, self.name.frame.origin.y+self.name.frame.size.height, frame.size.width, 15))];
        self.singer.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.singer];
        
        
    }
    return self;
}
@end
