//
//  SongDataBase.h
//  BoboPlayer
//
//  Created by lanou on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongDataBase : NSObject

@property (nonatomic, strong) NSString *songName;
@property (nonatomic, strong) NSString *songID;
@property (nonatomic, strong) NSString *songAddress;
@property (nonatomic, strong) NSString *singerID;
@property (nonatomic, strong) NSString *singerName;
@property (nonatomic, strong) NSString *albumID;
@property (nonatomic, strong) NSString *albumName;
@property (nonatomic, strong) NSString *numList;
@property (nonatomic, strong) NSString *isCollect;

@property (nonatomic, strong)NSArray *auditionList;
@end
