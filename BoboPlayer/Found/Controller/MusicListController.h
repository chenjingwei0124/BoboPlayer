//
//  MusicListController.h
//  MyMusic
//
//  Created by sajyy on 15/10/28.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class MusicListModel;
@class TagModel;
@class ListModel;
@class categoryContentsModel;
@class listTwoModel;
@class ListThreeModel;
@class FirstKResultsModel;
@class FocusImagesModel;
@class ListFourModel;
@class ListThreeTModel;

typedef void(^listModelBlock)(ListModel *listModel);
@interface MusicListController : BaseViewController

@property(nonatomic,strong)MusicListModel *musicListModel;
@property(nonatomic,strong)TagModel *tagModel;
@property(nonatomic,strong)ListModel *listModel;
@property(nonatomic,strong)categoryContentsModel *categoryModel;
@property(nonatomic,strong)listTwoModel *listTwoM;
@property(nonatomic,strong)ListThreeModel *listThreeModel;
@property(nonatomic,strong)ListThreeTModel *listThreeTModel;
@property(nonatomic,strong)FirstKResultsModel *firstKResultsModel;
@property(nonatomic,strong)FocusImagesModel *focusImagesModel;
@property(nonatomic,strong)ListFourModel *listFourModel;
@property(nonatomic,strong)UITableView *musicListView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *buttonFatherView;
@property(nonatomic,strong)UICollectionView *moreButtonView;
@property(nonatomic,strong)UIButton *moreButton;

@property(nonatomic,copy)listModelBlock listBlock;

@end
