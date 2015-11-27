//
//  HotSong.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "HotSong.h"

@implementation HotSong


-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"listenCount"]) {
        if ([value floatValue] > 10000) {
            self.listenCount = [NSString stringWithFormat:@"%.2f万",[value floatValue]/10000];
        }else
        {
            self.listenCount = value;
        }
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = [value stringValue];
    }
    
}

@end
