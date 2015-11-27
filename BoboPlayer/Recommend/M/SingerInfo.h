//
//  SingerInfo.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingerInfo : NSObject

@property(nonatomic,strong)NSString *singerId;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *followCount;
@property(nonatomic,strong)NSString *commentCount; //评价
@property(nonatomic,strong)NSString *songsCount;
@property(nonatomic,strong)NSString *albumsCount;
@property(nonatomic,strong)NSString *videoCount;
@property(nonatomic,strong)NSString *brief;  //信息
//@property(nonatomic,strong)NSString *chineseName;
//@property(nonatomic,strong)NSString *englishName;
//@property(nonatomic,strong)NSString *country;
//@property(nonatomic,strong)NSString *nation;
//@property(nonatomic,strong)NSString *birthDate;
//@property(nonatomic,strong)NSString *birthPlace;
//@property(nonatomic,strong)NSString *height;
//@property(nonatomic,strong)NSString *weight;
//@property(nonatomic,strong)NSString *bloodType;
//@property(nonatomic,strong)NSString *companyName;
//@property(nonatomic,strong)NSString *career;
//@property(nonatomic,strong)NSString *achievements;
@property(nonatomic,strong)NSString *personalLife; //个人生活
@property(nonatomic,strong)NSString *entertainmentExperience; //演绎经历
@property(nonatomic,strong)NSString *awards;  //获奖记录

@property(nonatomic,strong)NSString *picUrl;
//@property(nonatomic,strong)NSMutableArray *alias;


@end
