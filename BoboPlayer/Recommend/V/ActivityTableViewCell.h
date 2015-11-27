//
//  ActivityTableViewCell.h
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)NSMutableArray *ActivityArray;
@property(nonatomic,strong)UICollectionView *collectionView;
@end
