//
//  HotSongDesc.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "HotSongDesc.h"

@implementation HotSongDesc


-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"isNameDisplay"]) {
        self.isNameDisplay = [value stringValue];
    }
    if ([key isEqualToString:@"style"]) {
        self.style = [value stringValue];
    }
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
