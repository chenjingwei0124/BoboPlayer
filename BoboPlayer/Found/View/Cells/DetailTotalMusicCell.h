//
//  DetailTotalMusicCell.h
//  MyMusic
//
//  Created by sajyy on 15/11/3.
//  Copyright © 2015年 sajyy. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AlbumListModel;
@interface DetailTotalMusicCell : UITableViewCell

@property(nonatomic,strong)UIImageView *titleImageView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *personImageView;
@property(nonatomic,strong)UILabel *personCountLabel;
@property(nonatomic,strong)UIImageView *timeImageView;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIImageView *commentImageView;
@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)AlbumListModel *albumListModel;

@end
