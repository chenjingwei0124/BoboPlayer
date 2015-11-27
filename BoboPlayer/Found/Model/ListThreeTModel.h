//
//  ListThreeTModel.h
//  MyMusic
//
//  Created by sajyy on 15/10/29.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListThreeTModel : NSObject

@property(nonatomic,assign)NSInteger Id;
@property(nonatomic,assign)NSInteger albumId;
@property(nonatomic,assign)NSInteger uid;
@property(nonatomic,strong)NSString *intro;
@property(nonatomic,strong)NSString *nickname;
@property(nonatomic,strong)NSString *albumCoverUrl290;
@property(nonatomic,strong)NSString *coverMiddle;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *tags;
@property(nonatomic,assign)NSInteger tracks;
@property(nonatomic,assign)NSInteger tracksCounts;
@property(nonatomic,assign)NSInteger playsCounts;
@property(nonatomic,assign)NSInteger lastUptrackId;
@property(nonatomic,strong)NSString *lastUptrackTitle;
@property(nonatomic,assign)NSInteger lastUptrackAt;
@property(nonatomic,assign)NSInteger isFinished;
@property(nonatomic,assign)NSInteger serialState;
@end
