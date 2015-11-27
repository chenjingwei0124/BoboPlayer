//
//  ListFourModel.h
//  MyMusic
//
//  Created by sajyy on 15/10/29.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListFourModel : NSObject

@property(nonatomic,assign)NSInteger Id;
@property(nonatomic,strong)NSString *shortTitle;
@property(nonatomic,strong)NSString *longTitle;
@property(nonatomic,strong)NSString *pic;
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,assign)NSInteger uid;
@property(nonatomic,assign)NSInteger trackId;
@property(nonatomic,assign)BOOL isShare;
@property(nonatomic,assign)BOOL is_External_url;

@end
