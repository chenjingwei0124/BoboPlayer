//
//  TopView.h
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlbumIdModel;
@class StoreView;
@interface TopView : UIView

@property(nonatomic,strong)UIImageView *largeImageView;
@property(nonatomic,strong)UIImageView *smallImageView;
@property(nonatomic,strong)UIImageView *signImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *desLabel;
@property(nonatomic,strong)UILabel *movieLabel;
@property(nonatomic,strong)UILabel *musicLabel;
@property(nonatomic,strong)StoreView *storeView1;
@property(nonatomic,strong)StoreView *storeView2;
@property(nonatomic,strong)AlbumIdModel *albumIdModel;
@end
