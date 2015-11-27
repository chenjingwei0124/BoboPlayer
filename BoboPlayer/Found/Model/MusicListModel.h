//
//  MusicListModel.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicListModel : NSObject

@property (nonatomic,strong)NSDictionary *tags;
@property (nonatomic,assign)NSInteger ret;
@property (nonatomic,strong)NSDictionary *categoryContents;
@property (nonatomic,assign)BOOL hasRecommendedZones;
@property (nonatomic,strong)NSDictionary *focusImages;
@property (nonatomic,strong)NSString *msg;

@end
