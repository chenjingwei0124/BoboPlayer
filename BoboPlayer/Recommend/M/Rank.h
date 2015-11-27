//
//  Rank.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rank : NSObject

@property(nonatomic,strong)NSDictionary *big_image;
@property(nonatomic,strong)NSString *created_time;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSMutableDictionary *image;
@property(nonatomic,strong)NSString *last_updated;
@property(nonatomic,strong)NSString *ranklist_id;
@property(nonatomic,strong)NSString *song_count;
@property(nonatomic,strong)NSString *songlist_id;
@property(nonatomic,strong)NSString *sub_title;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSMutableArray *songs1;


//@property (nonatomic,strong) NSString *pic;
//
//+ (Rank *)setModeWithDic:(NSDictionary *)dic;

@end
