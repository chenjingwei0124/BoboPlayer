
//
//  AlbumInfoTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "AlbumInfoTableViewCell.h"

@interface AlbumInfoTableViewCell ()

@property(nonatomic,strong)UIButton *button ;

@end
@implementation AlbumInfoTableViewCell

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
    
}
@end
