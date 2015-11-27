//
//  TagModel.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagModel : NSObject
@property(nonatomic,assign)long maxPageId;
@property(nonatomic,copy)NSMutableString *title;
@property(nonatomic,assign)long count;
@property(nonatomic,strong)NSArray *list;
@end
