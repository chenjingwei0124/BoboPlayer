//
//  PlayerView.h
//  BoboPlayer
//
//  Created by lanou on 15/10/31.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SongData;

@interface PlayerView : UIView
@property (nonatomic, strong)UIImageView *backImageV;

@property (nonatomic, strong)UIButton *backB;

@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *singerL;
@property (nonatomic, strong)UIImageView *singerV;

@property (nonatomic, strong)UIButton *upOneB;
@property (nonatomic, strong)UIButton *playB;
@property (nonatomic, strong)UIButton *nextOneB;

@property (nonatomic, strong)UIButton *orderB;
@property (nonatomic, strong)UIButton *playListB;

@property (nonatomic, strong)UILabel *timeingL;
@property (nonatomic, strong)UILabel *totalTimeL;
@property (nonatomic, strong)UISlider *sliderV;

@property (nonatomic, strong)SongData *songData;
@property (nonatomic, strong)UIButton *collectB;
@end
