//
//  SongDataTools.h
//  BoboPlayer
//
//  Created by lanou on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SongData;
@class SongDataBase;

@interface SongDataTools : NSObject

- (void)addSongData:(SongDataBase *)songData;
- (void)deleteSong:(SongData *)songData;
- (NSArray *)selectTotalSongArray;
- (NSArray *)selectCollectSongArray;
@end
