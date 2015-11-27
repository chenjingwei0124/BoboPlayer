//
//  BestNewSongViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "BestNewSongViewCell.h"

@interface BestNewSongViewCell ()

@property(nonatomic,strong)UIButton *button;

@end
@implementation BestNewSongViewCell

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
        
        self.moreButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.moreButton.frame = CGRectMake(300, 5, 30, 30);
        [self.moreButton setTitle:@"更多" forState:(UIControlStateNormal)];
        self.moreButton.tintColor = [UIColor grayColor];
        [self.contentView addSubview:self.moreButton];
        
        self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.button setImage:[UIImage imageNamed:@"iconfont-gengduo"] forState:(UIControlStateNormal)];
        self.button.frame = CGRectMake(340, 10, 20, 20);
        [self.contentView addSubview:self.button];
        //song1
        self.imageV1 = [[UIImageView alloc]initWithFrame:(CGRectMake(10, 35, self.contentView.bounds.size.width/3 +5, 100))];
        [self.contentView addSubview:self.imageV1];
        
        self.btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn1.frame = CGRectMake(10, 35, self.contentView.bounds.size.width/3 +5, 100);
        [self.contentView addSubview:self.btn1];
        
        
        self.name1 = [[UILabel alloc]initWithFrame:(CGRectMake(10, self.imageV1.frame.origin.y+self.imageV1.frame.size.height, self.imageV1.frame.size.width, 60))];
        self.name1.numberOfLines = 0;
        [self.contentView addSubview:self.name1];
        
        //song2
        self.imageV2 = [[UIImageView alloc]initWithFrame:(CGRectMake(self.imageV1.frame.size.width+20,35, self.imageV1.frame.size.width, 100))];
        [self.contentView addSubview:self.imageV2];
        self.btn2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn2.frame = CGRectMake(self.imageV1.frame.size.width+20,35, self.imageV1.frame.size.width, 100);
        [self.contentView addSubview:self.btn2];
        
        self.name2 = [[UILabel alloc]initWithFrame:(CGRectMake(self.imageV2.frame.origin.x, self.imageV2.frame.origin.y+self.imageV2.frame.size.height, self.imageV2.frame.size.width, 60))];
        self.name2.numberOfLines = 0;
        [self.contentView addSubview:self.name2];
        
        //song3
        self.imageV3 = [[UIImageView alloc]initWithFrame:(CGRectMake(self.imageV2.frame.origin.x+self.imageV2.frame.size.width+10, 35, self.imageV2.frame.size.width, 100))];
        [self.contentView addSubview:self.imageV3];
        self.btn3 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn3.frame = CGRectMake(self.imageV2.frame.origin.x+self.imageV2.frame.size.width+10, 35, self.imageV2.frame.size.width, 100);
        [self.contentView addSubview:self.btn3];
        
        self.name3 = [[UILabel alloc]initWithFrame:(CGRectMake(self.imageV3.frame.origin.x, self.imageV3.frame.origin.y+self.imageV3.frame.size.height, self.imageV3.frame.size.width, 60))];
        self.name3.numberOfLines = 0;
        [self.contentView addSubview:self.name3];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10, 5, 200, 30);
    self.moreButton.frame = CGRectMake(self.contentView.frame.size.width/1.25, 5, 30, 30);
    self.button.frame = CGRectMake(self.contentView.frame.size.width/1.1, 10, 20, 20);
}
@end
