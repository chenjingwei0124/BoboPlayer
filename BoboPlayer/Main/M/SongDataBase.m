//
//  SongDataBase.m
//  BoboPlayer
//
//  Created by lanou on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SongDataBase.h"

@implementation SongDataBase

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"name"]) {
        self.songName = value;
    }
    if ([key isEqualToString:@"songId"]) {
        self.songID = [value stringValue];
    }
    if ([key isEqualToString:@"singerId"]) {
        self.singerID = [value stringValue];
    }
    if ([key isEqualToString:@"albumId"]) {
        self.albumID = [value stringValue];
    }
}
@end
