//
//  SetView.h
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AlbumIdModel;
@interface SetView : UIView

@property(nonatomic,strong)UILabel *totalSetLabel;
@property(nonatomic,strong)UIImageView *selectView;
@property(nonatomic,strong)UIButton *selectButton;
@property(nonatomic,strong)UIImageView *relationView;
@property(nonatomic,strong)UIButton *relationButton;
@property(nonatomic,strong)AlbumIdModel *albumIdM;
@end
