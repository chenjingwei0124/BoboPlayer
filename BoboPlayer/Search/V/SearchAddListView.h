//
//  SearchAddListView.h
//  BoboPlayer
//
//  Created by lanou on 15/11/4.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SongDataBase;

typedef void(^searchPopBlock)(void);

@interface SearchAddListView : UIView
@property (nonatomic, strong)UIButton *cancelB;
@property (nonatomic, retain) SongDataBase *songDataBase;

@property (nonatomic, strong)searchPopBlock searchPopBlock;

@end
