//
//  SongSListTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongSListTableViewCell.h"

@implementation SongSListTableViewCell

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
        self.num = [[UILabel alloc]init];
        [self.contentView addSubview:self.num];
        
        self.name = [[UILabel alloc]init];
        [self.contentView addSubview:self.name];
        
        self.singerName = [[UILabel alloc]init];
        [self.contentView addSubview:self.singerName];
        
        self.like = [[UIImageView alloc]init];
        [self.contentView addSubview:self.like];
        
        self.count = [[UILabel alloc]init];
        [self.contentView addSubview:self.count];
        
        self.xia = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:self.xia];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.num.frame = CGRectMake(0, 5, 50, 30);
    
    self.name.frame = CGRectMake(50, 5, self.contentView.frame.size.width/2, 30);
    self.singerName.frame = CGRectMake(50, 5+30, 100, 30);
    
    self.like.frame = CGRectMake(self.singerName.frame.origin.y+100+5+10, self.singerName.frame.origin.y, 20, 20);
    self.like.image = [UIImage imageNamed:@"iconfont-aixin"];
    
    self.count.frame = CGRectMake(self.like.frame.origin.x+25, self.like.frame.origin.y, 60, 30);
    
    self.xia.frame = CGRectMake(self.contentView.frame.size.width-40, 20, 25, 25);
    [self.xia setImage:[UIImage imageNamed:@"iconfont-gengduo"] forState:(UIControlStateNormal)];
    
}
@end
