//
//  EverySong.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EverySong : NSObject


@property(nonatomic,strong)NSMutableDictionary *action;
@property(nonatomic,strong)NSString *author;
@property(nonatomic,strong)NSString *comments;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *detail;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *listenCount;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *picUrl;

@end
