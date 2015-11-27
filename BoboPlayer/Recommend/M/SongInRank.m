//
//  SongInRank.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongInRank.h"

@implementation SongInRank


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
//        self.ID = [value stringValue];
        self.ID = [NSString stringWithFormat:@"%@",value];
    }
}
@end
