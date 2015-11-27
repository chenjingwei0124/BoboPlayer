//
//  SongsInList.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongsInList.h"

@implementation SongsInList

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"favorite_count"]) {
        self.favorite_count = [value stringValue];
    }
    if ([key isEqualToString:@"comment_count"]) {
        self.comment_count = [value stringValue];
    }
    if ([key isEqualToString:@"share_count"]) {
        self.share_count = [value stringValue];
    }
    if ([key isEqualToString:@"songs"]) {
        self.songs = [NSMutableArray array];
    }
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
