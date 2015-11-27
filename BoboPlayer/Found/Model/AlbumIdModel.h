//
//  AlbumIdModel.h
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumIdModel : NSObject
@property(nonatomic,assign)NSInteger albumId;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *intro;
@property(nonatomic,strong)NSString *avatarPath;
@property(nonatomic,strong)NSString *tags;
@property(nonatomic,strong)NSString *nickname;
@property(nonatomic,strong)NSString *coverSmall;
@property(nonatomic,strong)NSString *coverMiddle;
@property(nonatomic,assign)NSInteger tracks;
@end
