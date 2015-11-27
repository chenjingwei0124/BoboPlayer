//
//  Singer.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "Singer.h"

@implementation Singer


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"singer_id"]) {
        self.singer_id = [value stringValue];
    }
}
@end
