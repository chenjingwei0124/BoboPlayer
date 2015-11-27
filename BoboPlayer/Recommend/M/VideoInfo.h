//
//  VideoInfo.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoInfo : NSObject

@property(nonatomic,strong)NSString *songName;
@property(nonatomic,strong)NSString *singerName;
@property(nonatomic,strong)NSString *pickCount;
@property(nonatomic,strong)NSString *bulletCount;
@property(nonatomic,strong)NSString *picUrl;
@property(nonatomic,strong)NSMutableArray *myList;


@end
