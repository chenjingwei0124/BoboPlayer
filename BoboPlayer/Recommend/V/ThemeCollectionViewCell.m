//
//  ThemeCollectionViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "ThemeCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation ThemeCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageV1 = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, frame.size.width/3, 70))];
        [self.contentView addSubview:self.imageV1];
        
        self.name1 = [[UILabel alloc]initWithFrame:(CGRectMake(10+self.imageV1.frame.size.width+5, self.imageV1.frame.origin.y, 200, 30))];
        [self.contentView addSubview:self.name1];
        
        self.desc1 = [[UILabel alloc]initWithFrame:(CGRectMake(self.name1.frame.origin.x, self.name1.frame.origin.y+30, 250, 50))];
        self.desc1.font = [UIFont systemFontOfSize:14];
        self.desc1.numberOfLines = 0;
        self.desc1.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.desc1];

    }
    return self;
}
-(void)setSong:(ThemeSong *)song
{
    _song = song;
    [self.imageV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",song.picUrl]] placeholderImage:nil];
    self.name1.text = song.name;
    self.desc1.text = song.desc;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageV1 = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, self.frame.size.width/3, self.frame.size.height))];
}
@end
