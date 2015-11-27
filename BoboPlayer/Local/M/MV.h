//
//  MV.h
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MVList;

@interface MV : NSObject

@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *bigPicUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, retain) MVList *mvlist;
@property (nonatomic, strong) NSString *singerName;
@property (nonatomic, strong) NSString *videoName;
@end
