//
//  SongInList2.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongInList2.h"

@implementation SongInList2

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"favorites"]) {
        if ([value floatValue] >10000) {
            self.favorites = [NSString stringWithFormat:@"%.2f万",[value floatValue]/10000];
        }else{
        
              self.favorites = [value stringValue];
        }

    }
    if ([key isEqualToString:@"auditionList"]) {
        self.auditionList = [NSMutableArray arrayWithArray:value];
    }
    if ([key isEqualToString:@"songId"]) {
        self.songId = [value stringValue];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
