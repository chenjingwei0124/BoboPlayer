//
//  SongHourViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongHourViewCell.h"

@interface SongHourViewCell()

@property(nonatomic,strong)UILabel *lable1;
@property(nonatomic,strong)UILabel *lable2;

@property(nonatomic,strong)UIButton *button;

@end
@implementation SongHourViewCell

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
        self.lable1 = [[UILabel alloc]initWithFrame:(CGRectMake(10, 5, self.contentView.frame.size.width/3.5, 30))];
        self.lable1.text = @"大家在听";
        [self.contentView addSubview:self.lable1];
        
        self.lable2 = [[UILabel alloc]initWithFrame:(CGRectMake(self.lable1.frame.origin.x+self.lable1.frame.size.width, 5, self.lable1.frame.size.width, 30))];
        self.lable2.font = [UIFont systemFontOfSize:14];
        self.lable2.text = @"(每小时更新)";
        self.lable2.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.lable2];
        
        self.moreButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.moreButton.frame = CGRectMake(300, 5, 30, 30);
        [self.moreButton setTitle:@"更多" forState:(UIControlStateNormal)];
        self.moreButton.tintColor = [UIColor grayColor];
        [self.contentView addSubview:self.moreButton];
        
        self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.button setImage:[UIImage imageNamed:@"iconfont-gengduo"] forState:(UIControlStateNormal)];
        self.button.frame = CGRectMake(340, 10, 20, 20);
        [self.contentView addSubview:self.button];
        //first song
        UILabel *lable3 = [[UILabel alloc]initWithFrame:(CGRectMake(10, 35+15,30,30 ))];
        lable3.text = @"1";
        [self.contentView addSubview:lable3];
        
        self.firstImageV = [[UIImageView alloc]initWithFrame:(CGRectMake(40, 35, self.contentView.frame.size.width/5.5, 60))];
        [self.contentView addSubview:self.firstImageV];
        
        self.btn1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
//        self.btn1.frame = CGRectMake(40, 35, self.contentView.frame.size.width/5.5, 60);
        [self.contentView addSubview:self.btn1];
        
        self.songLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.firstImageV.frame.origin.x+self.firstImageV.frame.size.width+10, self.firstImageV.frame.origin.y, 100, 30))];
        [self.contentView addSubview:self.songLable];
        
        self.singerLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.songLable.frame.origin.x, self.songLable.frame.origin.y+30, 100, 30))];
        self.singerLable.font = [UIFont systemFontOfSize:14];
        self.singerLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.singerLable];
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:(CGRectMake(self.singerLable.frame.origin.x+100, self.singerLable.frame.origin.y, 20, 20))];
        imageV.image = [UIImage imageNamed:@"iconfont-aixin"];
        [self.contentView addSubview:imageV];
        
        self.loveLable = [[UILabel alloc]initWithFrame:(CGRectMake(imageV.frame.origin.x+30, imageV.frame.origin.y, 100, 30))];
        self.loveLable.font = [UIFont systemFontOfSize:14];
        self.loveLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.loveLable];
        
        UIImageView *imageV2 = [[UIImageView alloc]initWithFrame:(CGRectMake(self.contentView.frame.size.width-10, lable3.frame.origin.y, 40, 40))];
        imageV2.image = [UIImage imageNamed:@"iconfont-bofang"];
         self.btn1.frame = CGRectMake(self.contentView.frame.size.width-10, lable3.frame.origin.y, 40, 40);
        [self.contentView addSubview:imageV2];
        
        
        //second song
        UILabel *lable4 = [[UILabel alloc]initWithFrame:(CGRectMake(10, self.firstImageV.frame.origin.y+self.firstImageV.frame.size.height+self.firstImageV.frame.size.height/3,30,30 ))];
        lable4.text = @"2";
        [self.contentView addSubview:lable4];
        
        self.secondImageV = [[UIImageView alloc]initWithFrame:(CGRectMake(40, self.firstImageV.frame.origin.y+self.firstImageV.frame.size.height+5, self.contentView.frame.size.width/5.5, 60))];
        [self.contentView addSubview:self.secondImageV];
        
        self.btn2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
//        self.btn2.frame = CGRectMake(40, self.firstImageV.frame.origin.y+self.firstImageV.frame.size.height+5, self.contentView.frame.size.width/5.5, 60);
        [self.contentView addSubview:self.btn2];
        
        self.secondSongLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.secondImageV.frame.origin.x+self.secondImageV.frame.size.width+10, self.secondImageV.frame.origin.y, 100, 30))];
        [self.contentView addSubview:self.secondSongLable];
        
        self.secondSingerLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.secondSongLable.frame.origin.x, self.secondSongLable.frame.origin.y+30, 100, 30))];
        self.secondSingerLable.font = [UIFont systemFontOfSize:14];
        self.secondSingerLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.secondSingerLable];
        
        UIImageView *imageV3 = [[UIImageView alloc]initWithFrame:(CGRectMake(self.secondSingerLable.frame.origin.x+100, self.secondSingerLable.frame.origin.y, 20, 20))];
        imageV3.image = [UIImage imageNamed:@"iconfont-aixin"];
        [self.contentView addSubview:imageV3];
        
        
        
        self.secondLoveLable = [[UILabel alloc]initWithFrame:(CGRectMake(imageV3.frame.origin.x+30, imageV3.frame.origin.y, 100, 30))];
        self.secondLoveLable.font = [UIFont systemFontOfSize:14];
        self.secondLoveLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.secondLoveLable];
        
        UIImageView *imageV4 = [[UIImageView alloc]initWithFrame:(CGRectMake(self.contentView.frame.size.width-10, lable4.frame.origin.y, 40, 40))];
        imageV4.image = [UIImage imageNamed:@"iconfont-bofang"];
        self.btn2.frame = CGRectMake(self.contentView.frame.size.width-10, lable4.frame.origin.y, 40, 40);
        [self.contentView addSubview:imageV4];
        
        //third
        UILabel *lable5 = [[UILabel alloc]initWithFrame:(CGRectMake(10, self.secondImageV.frame.origin.y+self.secondImageV.frame.size.height+self.secondImageV.frame.size.height/3,30,30 ))];
        lable5.text = @"3";
        [self.contentView addSubview:lable5];
        
        self.thirdImageV = [[UIImageView alloc]initWithFrame:(CGRectMake(40, self.secondImageV.frame.origin.y+self.secondImageV.frame.size.height+5, self.contentView.frame.size.width/5.5, 60))];
        [self.contentView addSubview:self.thirdImageV];
        
        self.btn3 = [UIButton buttonWithType:(UIButtonTypeSystem)];
//        self.btn3.frame = CGRectMake(40, self.secondImageV.frame.origin.y+self.secondImageV.frame.size.height+5, self.contentView.frame.size.width/5.5, 60);
        
        [self.contentView addSubview:self.btn3];
        
        self.thirdSongLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.thirdImageV.frame.origin.x+self.thirdImageV.frame.size.width+10, self.thirdImageV.frame.origin.y, 100, 30))];
        [self.contentView addSubview:self.thirdSongLable];
        
        self.thirdSingerLable = [[UILabel alloc]initWithFrame:(CGRectMake(self.thirdSongLable.frame.origin.x, self.thirdSongLable.frame.origin.y+30, 100, 30))];
        self.thirdSingerLable.font = [UIFont systemFontOfSize:14];
        self.thirdSingerLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.thirdSingerLable];
        
        UIImageView *imageV5 = [[UIImageView alloc]initWithFrame:(CGRectMake(self.thirdSingerLable.frame.origin.x+100, self.thirdSingerLable.frame.origin.y, 20, 20))];
        imageV5.image = [UIImage imageNamed:@"iconfont-aixin"];
        [self.contentView addSubview:imageV5];
        
        self.thirdLoveLable = [[UILabel alloc]initWithFrame:(CGRectMake(imageV5.frame.origin.x+30, imageV5.frame.origin.y, 100, 30))];
        self.thirdLoveLable.font = [UIFont systemFontOfSize:14];
        self.thirdLoveLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.thirdLoveLable];
        
        UIImageView *imageV6 = [[UIImageView alloc]initWithFrame:(CGRectMake(self.contentView.frame.size.width-10, lable5.frame.origin.y, 40, 40))];
        imageV6.image = [UIImage imageNamed:@"iconfont-bofang"];
        self.btn3.frame = CGRectMake(self.contentView.frame.size.width-10, lable5.frame.origin.y, 40, 40);
        [self.contentView addSubview:imageV6];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.moreButton.frame = CGRectMake(self.contentView.frame.size.width/1.25, 5, 30, 30);
    self.button.frame = CGRectMake(self.contentView.frame.size.width/1.1, 10, 20, 20);
}
@end
