
//
//  SongInfo.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongInfo.h"
//#import "PlayUrl.h"
@implementation SongInfo



-(void)setValue:(id)value forKey:(NSString *)key
{

    [super setValue:value forKey:key];
    if ([key isEqualToString:@"auditionList"]) {
        
        self.auditionList = [NSMutableArray arrayWithArray:value];
    }
    
    
    if ([key isEqualToString:@"favorites"]) {
        if ([value floatValue] > 10000) {
            self.favorites = [NSString stringWithFormat:@"%.2f万",[value floatValue]/10000];
        }else
        {
            self.favorites = [value stringValue];
        }
        
    }
  
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
