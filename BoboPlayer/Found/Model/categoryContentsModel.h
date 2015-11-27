//
//  categoryContentsModel.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface categoryContentsModel : NSObject
@property(nonatomic,assign)NSInteger ret;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSMutableArray *list;
@end
