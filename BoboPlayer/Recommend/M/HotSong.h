//
//  HotSong.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotSong : NSObject

//最热歌单 和 星期歌单 共用
@property(nonatomic,strong)NSMutableDictionary *action;
@property(nonatomic,strong)NSString *author;
@property(nonatomic,strong)NSString *comments;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *listenCount;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *picUrl;
@end
