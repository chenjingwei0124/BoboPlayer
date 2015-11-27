//
//  SongListCollectionViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongListCollectionViewCell.h"

@implementation SongListCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height-30))];
        [self.contentView addSubview:self.imageV];
        
        UIImageView *imageV1 = [[UIImageView alloc]initWithFrame:(CGRectMake(self.imageV.frame.size.width/2, 5, 20, 20))];
        imageV1.image = [UIImage imageNamed:@"erji"];
        [self.contentView addSubview:imageV1];
        
        self.count = [[UILabel alloc]initWithFrame:(CGRectMake(imageV1.frame.origin.x+imageV1.frame.size.width, 5, self.imageV.frame.size.width/2-20, 20))];
        self.count.font = [UIFont systemFontOfSize:14];
        self.count.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.count];
        
        
        self.name = [[ UILabel alloc]initWithFrame:(CGRectMake(0, self.imageV.frame.size.height, frame.size.width, 30))];
        self.name.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.name];
        
    }
    return self;
}

@end
