//
//  NewestList.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/30.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewestList : NSObject

@property(nonatomic,strong)NSString *albumld;
@property(nonatomic,strong)NSString *albumRightKey;
@property(nonatomic,strong)NSString *desc;  //描述
@property(nonatomic,strong)NSString *ID;  //
@property(nonatomic,strong)NSString *lang;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *picUrl;
@property(nonatomic,strong)NSString *publishDate;
@property(nonatomic,strong)NSString *publishYear;
@property(nonatomic,strong)NSString *singerName;
@property(nonatomic,strong)NSString *songs;
@property(nonatomic,strong)NSString *week;
@property(nonatomic,strong)NSString *year;



@end
