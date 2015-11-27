//
//  SongInfo.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongInfo : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *singerName;
@property(nonatomic,strong)NSString *favorites;
@property(nonatomic,strong)NSMutableArray *auditionList;


@end
