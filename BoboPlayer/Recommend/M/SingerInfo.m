//
//  SingerInfo.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerInfo.h"

@implementation SingerInfo

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    
    if ([key isEqualToString:@"singerId"]) {
        self.singerId = [value stringValue];
    }
    if ([key isEqualToString:@"followCount"]) {
        self.followCount = [value stringValue];
    }
    if ([key isEqualToString:@"commentCount"]) {
        self.commentCount = [value stringValue];
    }
    if ([key isEqualToString:@"songsCount"]) {
        self.songsCount = [value stringValue];
    }
    if ([key isEqualToString:@"videoCount"]) {
        self.videoCount = [value stringValue];
    }
    if ([key isEqualToString:@"albumsCount"]) {
        self.albumsCount = [value stringValue];
    }
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
