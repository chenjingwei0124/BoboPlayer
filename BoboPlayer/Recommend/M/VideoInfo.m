//
//  VideoInfo.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "VideoInfo.h"

@implementation VideoInfo

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.myList = [NSMutableArray array];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"pickCount"]) {
        self.pickCount = [value stringValue];
    }
    if ([key isEqualToString:@"bulletCount"]) {
        self.bulletCount = [value stringValue];
    }
    if ([key isEqualToString:@"myList"]) {
        self.myList = [NSMutableArray arrayWithArray:value];
    }
}
@end
