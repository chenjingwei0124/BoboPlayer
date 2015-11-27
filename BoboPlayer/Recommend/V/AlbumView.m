
//
//  AlbumView.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "AlbumView.h"
#import "AlbumInfoTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "AlbumInfo.h"
@interface AlbumView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation AlbumView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableV = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height)) style:(UITableViewStylePlain)];
        self.tableV.delegate = self;
        self.tableV.dataSource = self;
        [self addSubview:self.tableV];
    }
    return  self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.albumArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    AlbumInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[AlbumInfoTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    AlbumInfo *info = self.albumArr[indexPath.row];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",info.picUrl]] placeholderImage:nil];
    cell.name.text = info.name;
    cell.singerName.text = info.singerName;
    return cell;
}
-(void)setAlbumArr:(NSMutableArray *)albumArr
{
    _albumArr = albumArr;
    [self.tableV reloadData];
    
}
@end
