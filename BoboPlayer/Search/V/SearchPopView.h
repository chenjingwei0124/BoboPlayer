//
//  SearchPopView.h
//  BoboPlayer
//
//  Created by lanou on 15/11/4.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^searchPopBlock)(void);

@interface SearchPopView : UIView

@property (nonatomic, strong)searchPopBlock searchPopBlock;
@end
