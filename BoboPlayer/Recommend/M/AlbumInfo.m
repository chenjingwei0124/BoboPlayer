//
//  AlbumInfo.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "AlbumInfo.h"

@implementation AlbumInfo

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"albumId"]) {
        self.albumId = [value stringValue];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
