
//
//  VideoUrl.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "VideoUrl.h"

@implementation VideoUrl

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"videoId"]) {
        self.videoId = [value stringValue];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
