//
//  VideoView.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "VideoView.h"
#import "VideoViewTableViewCell.h"
#import "VideoInfo.h"
#import "UIImageView+WebCache.h"
@interface VideoView ()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation VideoView

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
    if (self.videoArr.count>0) {
        return self.videoArr.count;
    }else{
        return 1;}
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.videoArr.count>0) {
        return 100;
    }else{
        return self.frame.size.height;}
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"cell";
    VideoViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[VideoViewTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    if (self.videoArr.count == 0) {
        cell.imageV.image = [UIImage imageNamed:@"iconfont-yutoubaoicon"];
        cell.name.text = @"无";
        cell.pickCount.text = @"无";
        cell.commentCount.text = @"无";
    }else{
        VideoInfo *info = self.videoArr[indexPath.row];
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",info.picUrl]] placeholderImage:nil];
        cell.name.text = info.songName;
        cell.singerName.text = info.singerName;
        cell.pickCount.text = info.pickCount;
        cell.commentCount.text = info.bulletCount;
    }
    return cell;
}
-(void)setVideoArr:(NSMutableArray *)videoArr
{
    _videoArr = videoArr;
    [self.tableV reloadData];
}
@end
