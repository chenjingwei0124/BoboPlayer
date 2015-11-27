//
//  RankName.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RankName : NSObject


@property(nonatomic,strong)NSString *channel_id;
@property(nonatomic,strong)NSString *code;
@property(nonatomic,strong)NSString *create_time;
@property(nonatomic,strong)NSString *last_updated;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSMutableArray *refs;
@property(nonatomic,strong)NSString *parent_id;

@end
