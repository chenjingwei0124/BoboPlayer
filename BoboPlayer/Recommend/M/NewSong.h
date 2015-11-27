//
//  NewSong.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewSong : NSObject

//和最新的音乐共用
@property(nonatomic,strong)NSMutableDictionary *action;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *picUrl;

@end
