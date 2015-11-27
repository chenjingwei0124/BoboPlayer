//
//  CategoryViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "CategoryViewCell.h"


@implementation CategoryViewCell

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
        //ranklist
        self.rankListImageV = [[UIImageView alloc]initWithFrame:(CGRectMake(30, 10, self.contentView.frame.size.width/5, 70))];
        self.rankButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.rankButton];
        [self.contentView addSubview:self.rankListImageV];
        self.rangkListLable = [[UILabel alloc]initWithFrame:(CGRectMake(30, 80, self.rankListImageV.bounds.size.width, 30))];
        self.rangkListLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.rangkListLable];
        
        //sonlist
        self.songListImageV = [[UIImageView alloc]initWithFrame:(CGRectMake(self.rankListImageV.frame.origin.x+self.rankListImageV.frame.size.width+20, 10, self.rankListImageV.bounds.size.width, 70))];
        [self.contentView addSubview:self.songListImageV];
        self.songListLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.songListImageV.frame.origin.x, self.songListImageV.frame.origin.y+self.songListImageV.bounds.size.height, self.songListImageV.bounds.size.width, 30))];
        self.songButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.songButton];
        self.songListLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.songListLable];
        
        //radiolist
        self.radioImageV = [[UIImageView alloc]initWithFrame:(CGRectMake(self.songListImageV.frame.origin.x+self.songListImageV.frame.size.width+20, 10, self.songListImageV.bounds.size.width, self.songListImageV.frame.size.height))];
        [self.contentView addSubview:self.radioImageV];
        self.radioLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.radioImageV.frame.origin.x, self.songListImageV.frame.origin.y+self.songListImageV.bounds.size.height, self.radioImageV.bounds.size.width, 30))];
        self.radioLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.radioLable];
        self.radioButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.radioButton];
        
        
        //singerlist
        self.singerImageV = [[UIImageView alloc]initWithFrame:(CGRectMake(self.radioImageV.frame.origin.x+self.radioImageV.bounds.size.width+20, 10, self.radioImageV.bounds.size.width, self.songListImageV.frame.size.height))];
        [self.contentView addSubview:self.singerImageV];
        self.singerLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.singerImageV.frame.origin.x, self.songListImageV.frame.origin.y+self.songListImageV.bounds.size.height, self.singerImageV.bounds.size.width, 30))];
        self.singerLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.singerLable];
        self.singerButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.singerButton];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.rankListImageV.frame = CGRectMake(30, 10, self.contentView.frame.size.width/5, 70);
    self.rankButton.frame = CGRectMake(30, 10, self.contentView.frame.size.width/5, 70);
    self.rangkListLable.frame = CGRectMake(30, 80, self.rankListImageV.bounds.size.width, 30);
    
    self.songListImageV.frame = CGRectMake(self.rankListImageV.frame.origin.x+self.rankListImageV.frame.size.width+10, 10, self.rankListImageV.bounds.size.width, 70);
    self.songListLable.frame = CGRectMake(self.songListImageV.frame.origin.x, self.songListImageV.frame.origin.y+self.songListImageV.bounds.size.height, self.songListImageV.bounds.size.width, 30);
    self.songButton.frame =  CGRectMake(self.rankListImageV.frame.origin.x+self.rankListImageV.frame.size.width+20, 10, self.rankListImageV.bounds.size.width, 70);
    
    self.radioImageV.frame = CGRectMake(self.songListImageV.frame.origin.x+self.songListImageV.frame.size.width+10, 10, self.songListImageV.bounds.size.width, self.songListImageV.frame.size.height);
    self.radioLable.frame = CGRectMake(self.radioImageV.frame.origin.x, self.songListImageV.frame.origin.y+self.songListImageV.bounds.size.height, self.radioImageV.bounds.size.width, 30);
    
    self.singerImageV.frame = CGRectMake(self.radioImageV.frame.origin.x+self.radioImageV.bounds.size.width+10, 10, self.radioImageV.bounds.size.width, self.songListImageV.frame.size.height);
    self.singerLable.frame = CGRectMake(self.singerImageV.frame.origin.x, self.songListImageV.frame.origin.y+self.songListImageV.bounds.size.height, self.singerImageV.bounds.size.width, 30);
    self.singerButton.frame = CGRectMake(self.radioImageV.frame.origin.x+self.radioImageV.bounds.size.width+10, 10, self.radioImageV.bounds.size.width, self.songListImageV.frame.size.height);
    
}
@end
