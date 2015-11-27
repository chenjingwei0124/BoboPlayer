//
//  ThemeModel.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/4.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "ThemeModel.h"

@implementation ThemeModel

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"onlineTime"]) {
        self.onlineTime = [value stringValue];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
