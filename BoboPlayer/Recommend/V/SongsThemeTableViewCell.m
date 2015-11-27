//
//  SongsThemeTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/4.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongsThemeTableViewCell.h"

@implementation SongsThemeTableViewCell

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
        
        self.desc = [[UILabel alloc]init];
        [self.contentView addSubview:self.desc];
        
        self.time = [[UILabel alloc]init];
        [self.contentView addSubview:self.time];
    }
    return self;
}
-(void)layoutSubviews
{
    self.imageV.frame = CGRectMake(10, 0, self.contentView.frame.size.width-20, 100);
    
    self.name.frame = CGRectMake(10, self.imageV.frame.size.height+self.imageV.frame.origin.y+10, self.contentView.frame.size.width-20, 30);
    
    self.desc.frame = CGRectMake(10, self.name.frame.origin.y+self.name.frame.size.height+5, self.contentView.frame.size.width, 30);
    
   
}
@end
