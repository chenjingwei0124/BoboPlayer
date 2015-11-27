//
//  NewestMV.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "NewestMV.h"

@implementation NewestMV


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"bulletCount"]) {
        self.bulletCount = [value stringValue];
    }
    if ([key isEqualToString:@"down"]) {
        self.down = [value stringValue];
    }
    if ([key isEqualToString:@"listenCount"]) {
        self.listenCount = [value stringValue];
    }
    if ([key isEqualToString:@"up"]) {
        self.up = [value stringValue];
    }
    if ([key isEqualToString:@"comments"]) {
        self.comments = [value stringValue];
    }
}

@end
