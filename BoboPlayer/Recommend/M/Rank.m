//
//  Rank.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "Rank.h"
#import "SongInRank.h"
@implementation Rank


-(instancetype)init{
    self = [super init];
    if (self) {
        self.songs1  = [NSMutableArray array];
    }
    return self;
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"songs"]) {
        for (NSDictionary *dic in value) {
            SongInRank *moedel = [[SongInRank alloc]init];
            [moedel setValuesForKeysWithDictionary:dic];
            [self.songs1 addObject:moedel];
        }
    }

}
-(void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"image"]) {
        self.image = [NSMutableDictionary dictionaryWithDictionary:value];
    }
    
}

    
//+ (Rank *)setModeWithDic:(NSDictionary *)dic{
//    NSLog(@"%@",dic);
//    Rank *mode = [[Rank alloc] init];
//    NSDictionary *imageDic = [dic objectForKey:@"big_image"];
//    [mode setValuesForKeysWithDictionary:imageDic];
//
//    return mode;
//}

@end
