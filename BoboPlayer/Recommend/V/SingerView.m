//
//  SingerView.m
//  MusicPlayer
//
//  Created by 葛宏兵 on 15/11/2.
//  Copyright © 2015年 葛宏兵. All rights reserved.
//

#import "SingerView.h"
#import "SingerInfoTableViewCell.h"
@interface SingerView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableV;



@end
@implementation SingerView

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
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    CGRect rect1 = [self.info.brief boundingRectWithSize:(CGSizeMake(self.bounds.size.width-10, 3000)) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    CGRect rect2 = [self.info.personalLife boundingRectWithSize:(CGSizeMake(self.bounds.size.width-10, 3000)) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    CGRect rect3 = [self.info.entertainmentExperience boundingRectWithSize:(CGSizeMake(self.bounds.size.width-10, 3000)) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return 450+rect1.size.height+rect2.size.height+rect3.size.height;


}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"inFoCell";
    SingerInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[SingerInfoTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reuseIdentifier];
    }
    //设置单元格
    
    cell.brief.text = self.info.brief;
    NSString *personStr = self.info.personalLife;
    if (personStr.length == 0) {
        cell.personal.text = @"无";
    }else
    {
        cell.personal.text = self.info.personalLife;
    }
    NSString *exeStr = self.info.entertainmentExperience;
    if (exeStr.length == 0) {
        cell.experience.text = @"无";
    }else
    {
        cell.experience.text = self.info.entertainmentExperience;
    }
    
    
    return cell;
}
-(void)setInfo:(SingerInfo *)info
{
    _info = info;
    [self.tableV reloadData];
}
@end
