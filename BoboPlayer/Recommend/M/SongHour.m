//
//  SongHour.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongHour.h"

@implementation SongHour


-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"songId"]) {
        self.songId = [value stringValue];
    }
    if ([key isEqualToString:@"albumId"]) {
        self.albumId = [value stringValue];
    }
    if ([key isEqualToString:@"favorites"]) {
        self.favorites = [value stringValue];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
//
}
@end
