//
//  ThemeSong.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "ThemeSong.h"

@implementation ThemeSong

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"action"]) {
        self.action = [NSMutableDictionary dictionaryWithDictionary:value];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = [value stringValue];
    }
}
@end
