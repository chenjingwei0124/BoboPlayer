//
//  BottomView.h
//  MyMusic
//
//  Created by sajyy on 15/11/6.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomView : UIView
@property (nonatomic,strong)UISlider *playSlider;
@property (nonatomic,strong)UIButton *previousMusic;
@property (nonatomic,strong)UIButton *nextMusic;
@property (nonatomic,strong)UIButton *pauseMusic;
@property (nonatomic,strong)UILabel *timeLabel;
@end
