//
//  OnlyActivityViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "OnlyActivityViewCell.h"

@interface OnlyActivityViewCell ()

@property(nonatomic,strong)UIButton *moreButton;
@property(nonatomic,strong)UIButton *button;

@end
@implementation OnlyActivityViewCell

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
        
        self.button1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:self.button1];
        [self.button1 addTarget:self action:@selector(button1:) forControlEvents:(UIControlEventTouchUpInside)];
        
        self.imageV1 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV1];
        
        self.button2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:self.button2];
        [self.button2 addTarget:self action:@selector(button2:) forControlEvents:(UIControlEventTouchUpInside)];
        
        self.imageV2 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV2];
        
        self.button3 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.contentView addSubview:self.button3];
        [self.button3 addTarget:self action:@selector(button3:) forControlEvents:(UIControlEventTouchUpInside)];
        self.imageV3 = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageV3];

    }
    return self;
}
-(void)button1:(UIButton *)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"intoOnlyActivityVC" object:@"0"];
    
}
-(void)button2:(UIButton *)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"intoOnlyActivityVC1" object:@"1"];
    
}
-(void)button3:(UIButton *)button
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"intoOnlyActivityVC2" object:@"2"];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10, 5, 200, 30);
    self.moreButton.frame = CGRectMake(self.contentView.frame.size.width/1.25, 5, 30, 30);
    self.button.frame = CGRectMake(self.contentView.frame.size.width/1.1, 10, 20, 20);
    self.button1.frame = CGRectMake(25,55, self.contentView.frame.size.width/4, self.contentView.frame.size.width/4);
    self.button1.layer.cornerRadius = self.contentView.frame.size.width/8;
    self.button1.layer.masksToBounds = YES;
    self.imageV1.frame = CGRectMake(self.button1.frame.origin.x+10, 35, self.button1.frame.size.width-20, 20);
    
    
    
    self.button2.frame = CGRectMake(self.button1.frame.origin.x+self.button1.frame.size.width+20, 55, self.button1.frame.size.width, self.contentView.frame.size.width/4);
    self.button2.layer.cornerRadius = self.contentView.frame.size.width/8;
    self.button2.layer.masksToBounds = YES;
    self.imageV2.frame = CGRectMake(self.button2.frame.origin.x+10, 35, self.button2.frame.size.width-20, 20);
    
    self.button3.frame = CGRectMake(self.button2.frame.origin.x+self.button2.frame.size.width+20, 55, self.button2.frame.size.width, self.contentView.frame.size.width/4);
    self.button3.layer.cornerRadius = self.contentView.frame.size.width/8;
    self.button3.layer.masksToBounds = YES;
    self.imageV3.frame = CGRectMake(self.button3.frame.origin.x+10, 35, self.button3.frame.size.width-20, 20);
}
@end
