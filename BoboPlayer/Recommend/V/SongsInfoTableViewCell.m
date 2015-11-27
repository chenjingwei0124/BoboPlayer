//
//  SongsInfoTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongsInfoTableViewCell.h"

@interface SongsInfoTableViewCell ()

@property(nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UIButton *button;
@end
@implementation SongsInfoTableViewCell

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
        self.number = [[UILabel alloc]initWithFrame:(CGRectMake(10, 10, 20, 20))];
        [self.contentView addSubview:self.number];
        
        self.name = [[UILabel alloc]initWithFrame:(CGRectMake(30, 5, 200, 30))];
        [self.contentView addSubview:self.name];
        
        self.imageV = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV];
        
        self.singerName = [[UILabel alloc]init];
        [self.contentView addSubview:self.singerName];
        
        self.like = [[UILabel alloc]init];
        [self.contentView addSubview:self.like];
        
        self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:self.button];
        
    }
    return self;
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.number.frame = CGRectMake(0, 10, 20, 30);
    self.number.font = [UIFont systemFontOfSize:14];
    self.name.frame = CGRectMake(30, 5, 200, 30);
    
    
    self.singerName.frame = CGRectMake(10, self.name.frame.origin.y+self.name.frame.size.height, 100, 30);
    self.singerName.font = [UIFont systemFontOfSize:14];
    
    self.imageV.frame = CGRectMake(self.singerName.frame.origin.x+100, self.singerName.frame.origin.y, 20, 20);
    self.imageV.image = [UIImage imageNamed:@"iconfont-aixin"];
    
    self.like.frame = CGRectMake(self.imageV.frame.origin.x+20, self.imageV.frame.origin.y, 100, 30);
    
    self.button.frame = CGRectMake(self.contentView.frame.size.width-40, 20, 20, 20);
    [self.button setImage:[UIImage imageNamed:@"iconfont-gengduo"] forState:(UIControlStateNormal)];
}

@end
