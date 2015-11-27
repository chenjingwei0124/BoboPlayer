//
//  ActivityTableViewCell.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/10/29.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "ActivityTableViewCell.h"
#import "ThemeCollectionViewCell.h"

#import "ActivityViewController.h"
@interface ActivityTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UIButton *moreButton;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)UICollectionViewFlowLayout *layout;

@end
@implementation ActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.title = [[UILabel alloc]initWithFrame:(CGRectMake(10, 5, 200, 30))];
        [self.contentView addSubview:self.title];
        
        self.moreButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.moreButton.frame = CGRectMake(300, 5, 30, 30);
        [self.moreButton setTitle:@"更多" forState:(UIControlStateNormal)];
        self.moreButton.tintColor = [UIColor grayColor];
        [self.contentView addSubview:self.moreButton];
        
        self.button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self.button setImage:[UIImage imageNamed:@"iconfont-gengduo"] forState:(UIControlStateNormal)];
        self.button.frame = CGRectMake(340, 10, 20, 20);
        [self.contentView addSubview:self.button];
        
        self.layout = [[UICollectionViewFlowLayout alloc]init];
        self.layout.minimumLineSpacing = 5;
        CGFloat width = self.contentView.frame.size.width-10;
        CGFloat height = width/4;
        self.layout.itemSize = CGSizeMake(width, height);
        self.layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        //2,创建视图对象
        self.collectionView = [[UICollectionView alloc]initWithFrame:(CGRectMake(0, 35, self.contentView.frame.size.width, 300)) collectionViewLayout:self.layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.scrollEnabled = NO;
        [self.collectionView registerClass:[ThemeCollectionViewCell class] forCellWithReuseIdentifier:@"collectCell"];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.collectionView];
        
    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.ActivityArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThemeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectCell" forIndexPath:indexPath];
    ThemeSong *song = self.ActivityArray[indexPath.item];
    
    cell.song = song;
    return cell;
    
}
-(void)setActivityArray:(NSMutableArray *)ActivityArray
{
    _ActivityArray = [NSMutableArray arrayWithArray:ActivityArray];
    [self.collectionView reloadData];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10, 5, 200, 30);
    self.moreButton.frame = CGRectMake(self.contentView.frame.size.width/1.25, 5, 30, 30);
    self.button.frame = CGRectMake(self.contentView.frame.size.width/1.1, 10, 20, 20);
    
    self.collectionView.frame = CGRectMake(0, 35, self.contentView.frame.size.width, self.contentView.frame.size.height-35);
    CGFloat width = self.contentView.frame.size.width-10;
    CGFloat height = width/4;
    self.layout.itemSize = CGSizeMake(width, height);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThemeSong *song = self.ActivityArray[indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"intoActivityVC" object:song];


}
@end
