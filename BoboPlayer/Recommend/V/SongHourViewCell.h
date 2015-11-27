//
//  SongHourViewCell.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongHourViewCell : UITableViewCell
//first
@property(nonatomic,strong)UIImageView *firstImageV;
@property(nonatomic,strong)UILabel *songLable;
@property(nonatomic,strong)UILabel *singerLable;
@property(nonatomic,strong)UILabel *loveLable;
//second
@property(nonatomic,strong)UIImageView *secondImageV;
@property(nonatomic,strong)UILabel *secondSongLable;
@property(nonatomic,strong)UILabel *secondSingerLable;
@property(nonatomic,strong)UILabel *secondLoveLable;
//third
@property(nonatomic,strong)UIImageView *thirdImageV;
@property(nonatomic,strong)UILabel *thirdSongLable;
@property(nonatomic,strong)UILabel *thirdSingerLable;
@property(nonatomic,strong)UILabel *thirdLoveLable;

@property(nonatomic,strong)UIButton *btn1;
@property(nonatomic,strong)UIButton *btn2;
@property(nonatomic,strong)UIButton *btn3;
@property(nonatomic,strong)UIButton *moreButton;
@end
