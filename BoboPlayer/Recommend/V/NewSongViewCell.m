//
//  NewSongViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "NewSongViewCell.h"

@interface NewSongViewCell ()

@property(nonatomic,strong)UIImageView *imageV2;
@end
@implementation NewSongViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title = [[UILabel alloc]initWithFrame:(CGRectMake(10, 5, 200, 30))];
        [self.contentView addSubview:self.title];
        
        self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(10, 35, self.contentView.frame.size.width/5, 60))];
        [self.contentView addSubview:self.imageV];
        
        self.name = [[UILabel alloc]initWithFrame:(CGRectMake(15+self.imageV.frame.size.width, self.imageV.frame.origin.y+5, 200, 30))];
        [self.contentView addSubview:self.name];
        
        self.descLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.name.frame.origin.x, self.name.frame.origin.y+30, 250, 20))];
        self.descLable.font = [UIFont systemFontOfSize:15];
        self.descLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.descLable];
        
        self.imageV2 = [[UIImageView alloc]initWithFrame:(CGRectMake(330, self.name.frame.origin.y, 20, 20))];
        self.imageV2.image = [UIImage imageNamed:@"iconfont-gengduo"];
        [self.contentView addSubview:self.imageV2];
        
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageV2.frame =  CGRectMake(self.contentView.frame.size.width/1.1, self.name.frame.origin.y, 20, 20);
}
@end
