//
//  ListThreeModel.h
//  MyMusic
//
//  Created by sajyy on 15/10/29.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListThreeModel : NSObject
@property(nonatomic,strong)NSString *coverPath;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *subtitle;
@property(nonatomic,strong)NSString *key;
@property(nonatomic,assign)NSInteger orderNum;
@property(nonatomic,strong)NSString *contentType;
@property(nonatomic,strong)NSString *rankingRule;
@property(nonatomic,assign)NSInteger period;
@property(nonatomic,assign)NSInteger categoryId;
@property(nonatomic,assign)NSInteger firstId;
@property(nonatomic,strong)NSString *firstTitle;
@property(nonatomic,strong)NSString *calcPeriod;
@property(nonatomic,assign)NSInteger top;
@property(nonatomic,strong)NSArray *firstKResults;

@end
