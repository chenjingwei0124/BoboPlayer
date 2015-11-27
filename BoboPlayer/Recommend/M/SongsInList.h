//
//  SongsInList.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/3.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongsInList : NSObject

@property(nonatomic,strong)NSString *favorite_count;
@property(nonatomic,strong)NSString *comment_count;
@property(nonatomic,strong)NSString *share_count;
@property(nonatomic,strong)NSMutableArray *songs;


@end
