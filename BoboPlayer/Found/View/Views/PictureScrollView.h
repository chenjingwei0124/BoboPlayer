//
//  PictureScrollView.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListFourModel;
@interface PictureScrollView : UIScrollView
@property(nonatomic,strong)NSMutableArray *listFourArray;
@property(nonatomic,strong)ListFourModel *listFourModel;
@end
