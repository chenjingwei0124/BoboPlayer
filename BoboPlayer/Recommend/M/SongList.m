//
//  SongList.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongList.h"

//歌单
@implementation SongList

-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"_id"]) {
        self._id = [value stringValue];
    }
    if ([key isEqualToString:@"create_at"]) {
        self.create_at = [value stringValue];
    }
    if ([key isEqualToString:@"listen_count"]) {
        if ([value floatValue]> 10000) {
            self.listen_count = [NSString stringWithFormat:@"%.2f万",[value floatValue]/10000.0];
        }else
        {
            self.listen_count = [value stringValue];
        }
    }
    if ([key isEqualToString:@"quan_id"]) {
        self.quan_id = [value stringValue];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
