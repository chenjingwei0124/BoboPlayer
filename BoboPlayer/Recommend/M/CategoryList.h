//
//  CategoryList.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/27.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryList : NSObject


@property(nonatomic,strong)NSMutableDictionary *action;
@property(nonatomic,strong)NSString *desc;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *picUrl;

@end
