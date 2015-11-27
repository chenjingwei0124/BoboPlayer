//
//  EverySong.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "EverySong.h"

@implementation EverySong

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = [value stringValue];
    }
}
-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"action"]) {
        self.action = [NSMutableDictionary dictionaryWithDictionary:value];
    }
}
@end
