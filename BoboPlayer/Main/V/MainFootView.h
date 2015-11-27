//
//  MainFootView.h
//  ChoicePlayer
//
//  Created by lanou on 15/10/27.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^footBlock)(void);

@interface MainFootView : UIView
@property (nonatomic, strong)UIProgressView *progressV;

@property (nonatomic, strong)UIImageView *footImageV;
@property (nonatomic, strong)UIButton *footplayerB;
@property (nonatomic, strong)UIButton *footnextB;

@property (nonatomic, strong)UILabel *footnameL;
@property (nonatomic, strong)UILabel *footauthorL;

@property (nonatomic, strong)UIButton *footlistB;
@property (nonatomic, copy)footBlock footBlock;
@end
