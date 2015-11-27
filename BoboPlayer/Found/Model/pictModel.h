//
//  pictModel.h
//  MyMusic
//
//  Created by sajyy on 15/11/14.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pictModel : NSObject
@property(nonatomic,strong)NSString *playUrl64;
@property(nonatomic,strong)NSString *coverLarge;
@property(nonatomic,assign)NSInteger duration;
@property(nonatomic,strong)NSString *tags;
@end
