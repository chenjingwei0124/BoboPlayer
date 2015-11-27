//
//  AlbumTracksModel.h
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumTracksModel : NSObject
@property(nonatomic,strong)NSMutableArray *list;
@property(nonatomic,assign)NSInteger pageId;
@property(nonatomic,assign)NSInteger *pageSize;
@property(nonatomic,assign)NSInteger maxPageId;
@property(nonatomic,assign)NSInteger totalCount;
@end
