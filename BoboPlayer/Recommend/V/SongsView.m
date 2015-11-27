//
//  SongsView.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SongsView.h"
#import "SongsInfoTableViewCell.h"
#import "SongInfo.h"
#import "NetHandler.h"
#import "MJRefresh.h"
@interface SongsView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *songsArr;

@end

@implementation SongsView
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
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return self.songArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    SongsInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[SongsInfoTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    SongInfo *info = self.songArr[indexPath.row];
    cell.number.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    cell.name.text =  info.name;
    cell.singerName.text = info.singerName;
    cell.like.text = info.favorites;
    
    
    return cell;
}
-(void)setSongArr:(NSMutableArray *)songArr
{
    _songArr = songArr;
    [self.tableV reloadData];
}

@end
