//
//  ThemeSong.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThemeSong : NSObject

//和活动专区共用
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSMutableDictionary *action;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *picUrl;


@end
