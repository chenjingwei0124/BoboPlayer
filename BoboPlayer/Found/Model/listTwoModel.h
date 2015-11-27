//
//  listTwoModel.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface listTwoModel : NSObject

@property(nonatomic,assign)long hasMore;
@property(nonatomic,strong)NSString * calcDimension;
@property(nonatomic,strong)NSString *contentType;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,assign)long moduleType;
@property(nonatomic,strong)NSString *tagName;
@property(nonatomic,strong)NSArray *list;
@end
