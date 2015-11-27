//
//  AlbumInfo.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumInfo : NSObject


@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *singerName;
@property(nonatomic,strong)NSString *publishDate;
@property(nonatomic,strong)NSString *picUrl;
@property(nonatomic,strong)NSString *albumId;

@end
