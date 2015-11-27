//
//  SongHour.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongHour : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *favorites;
@property(nonatomic,strong)NSString *singerName;
@property(nonatomic,strong)NSString *picUrl;
@property(nonatomic,strong)NSString *songId;   //数字
@property(nonatomic,strong)NSString *albumId;  //数字
@property(nonatomic,strong)NSString *albumName;  //专辑名

@end
