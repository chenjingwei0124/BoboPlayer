//
//  SingerCategory.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/31.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerCategory.h"

@implementation SingerCategory

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = [value stringValue];
    }
}
@end
