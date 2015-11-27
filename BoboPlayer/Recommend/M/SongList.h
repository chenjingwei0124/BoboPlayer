//
//  SongList.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongList : NSObject

@property(nonatomic,strong)NSString *_id;
@property(nonatomic,strong)NSString *create_at;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *listen_count;
@property(nonatomic,strong)NSString *pic_url;
@property(nonatomic,strong)NSString *quan_id;
@property(nonatomic,strong)NSString *song_list;
@property(nonatomic,strong)NSString *title;

@end
