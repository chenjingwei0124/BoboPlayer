//
//  VideoViewTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "VideoViewTableViewCell.h"

@interface VideoViewTableViewCell ()

@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UIImageView *bofang;
@property(nonatomic,strong)UIImageView *pinglun;
@end
@implementation VideoViewTableViewCell

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
        self.imageV = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV];
        
        
        self.name = [[UILabel alloc]init];
        [self.contentView addSubview:self.name];
        
        self.singerName = [[UILabel alloc]init];
        [self.contentView addSubview:self.singerName];
        
        self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:self.button];
        self.imagePlace = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imagePlace];
        
        self.bofang = [[UIImageView alloc]init];
        [self.contentView addSubview:self.bofang];
        
        self.pinglun = [[UIImageView alloc]init];
        [self.contentView addSubview:self.pinglun];
        
        self.pickCount = [[UILabel alloc]init];
        [self.contentView addSubview:self.pickCount];
        
        self.commentCount = [[UILabel alloc]init];
        [self.contentView addSubview:self.commentCount];
        
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageV.frame = CGRectMake(10, 0, self.contentView.frame.size.width/5, self.contentView.frame.size.width/5);
    
    self.name.frame = CGRectMake(self.imageV.frame.origin.x+5+self.imageV.frame.size.width, 5, 200, 30);
    
    self.singerName.frame = CGRectMake(self.name.frame.origin.x, 35, 200, 30);
    
    self.button.frame = CGRectMake(self.contentView.frame.size.width-30, 10, 20, 20);
    [self.button setImage:[UIImage imageNamed:@"iconfont-gengduo"] forState:(UIControlStateNormal)];
    
    self.imagePlace.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
    self.bofang.frame = CGRectMake(self.name.frame.origin.x, self.singerName.frame.origin.y+30, 20, 20);
    self.bofang.image = [UIImage imageNamed:@"iconfont-bofang"];
    
    self.pickCount.frame = CGRectMake(self.bofang.frame.origin.x+25, self.bofang.frame.origin.y, 100, 30);
    
    self.pinglun.frame = CGRectMake(self.pickCount.frame.origin.x+100+5, self.pickCount.frame.origin.y, 20, 20);
    self.pinglun.image = [UIImage imageNamed:@"iconfont-pinglun"];
    
    self.commentCount.frame = CGRectMake(self.pinglun.frame.origin.x+25, self.pinglun.frame.origin.y, 100, 30);
}

@end
