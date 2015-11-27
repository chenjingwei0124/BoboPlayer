//
//  SearchDetailView.m
//  BoboPlayer
//
//  Created by lanou on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "SearchDetailView.h"
#import "SearchDetailCell.h"
#import "SongDataBase.h"

@interface SearchDetailView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableV;
@end

@implementation SearchDetailView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableV = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height))];
        self.tableV.delegate = self;
        self.tableV.dataSource = self;
        [self addSubview:self.tableV];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    SearchDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[SearchDetailCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    SongDataBase *songDataBase = self.array[indexPath.row];
//    cell.songDataBase = songDataBase;
    cell.numberL.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.songNameL.text = songDataBase.songName;
    if (songDataBase.albumName == nil) {
        songDataBase.albumName = songDataBase.singerName;
    }
//    if (songDataBase.auditionList.count == 0) {
//        cell.numberL.textColor = [UIColor grayColor];
//        cell.songNameL.textColor = [UIColor grayColor];
//        cell.singerNameL.textColor = [UIColor grayColor];
//    }
    cell.singerNameL.text = [NSString stringWithFormat:@"%@·%@", songDataBase.singerName, songDataBase.albumName];
    return cell;
}

- (void)setArray:(NSMutableArray *)array{
    _array = array;
    [self.tableV reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchDetailCell *cell = (SearchDetailCell *)[self.tableV cellForRowAtIndexPath:indexPath];
//    NSLog(@"%f", cell.frame.origin.y - self.tableV.contentOffset.y);
    self.searchDetailBlock(cell.frame.origin.y - self.tableV.contentOffset.y, indexPath.row);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.seachDeBlck();
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"1");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
