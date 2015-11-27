//
//  EverySongViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "EverySongViewCell.h"

@implementation EverySongViewCell

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
        
        self.imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(10, 35, self.contentView.frame.size.width/3.5, 100))];
        self.imageV.alpha = 0.7;
        self.imageV.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.imageV];
        
        self.monthLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.imageV.frame.origin.x+10, self.imageV.frame.origin.y+20, self.imageV.frame.size.width-20, 30))];
        self.monthLable.alpha = 0.5;
        self.monthLable.textColor = [UIColor blackColor];
        self.monthLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.monthLable];
        
        self.dayLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.monthLable.frame.origin.x, self.monthLable.frame.origin.y+30, self.monthLable.frame.size.width, 20))];
        self.dayLable.alpha = 0.5;
        self.dayLable.backgroundColor = [UIColor grayColor];
        self.dayLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.dayLable];
        
        self.descLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.imageV.frame.origin.x+5+self.imageV.frame.size.width, self.monthLable.frame.origin.y, self.contentView.frame.size.width*2/3+20, 60))];
        self.descLable.numberOfLines = 0;
        [self.contentView addSubview:self.descLable];
        
        
    }
    return self;
}
@end
