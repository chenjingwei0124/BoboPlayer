//
//  SingerMainViewController.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Singer.h"
#import "SingerInfo.h"
#import "BaseViewController.h"

@interface SingerMainViewController : BaseViewController


@property(nonatomic,strong)Singer *singer;
@property(nonatomic,strong)SingerInfo *singerInfo;
@property(nonatomic,strong)UILabel *followCount;
@property(nonatomic,strong)UILabel *commentCount;
@property(nonatomic,strong)UILabel *songsCount;
@property(nonatomic,strong)UILabel *albumsCount;

@end
