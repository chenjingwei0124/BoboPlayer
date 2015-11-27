//
//  HotSongDesc.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/28.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotSongDesc : NSObject

@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *isNameDisplay;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *style;
@property(nonatomic,strong)NSMutableDictionary *action;

@end
