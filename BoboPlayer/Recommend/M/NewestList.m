//
//  NewestList.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "NewestList.h"

@implementation NewestList


-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"week"]) {
        self.week = [value stringValue];
    }
    if ([key isEqualToString:@"year"]) {
        self.year = [value stringValue];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = [value stringValue];
    }
    if ([key isEqualToString:@"description"]) {
        self.desc = value;
    }
}
@end
