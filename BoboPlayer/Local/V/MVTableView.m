//
//  MVTableView.m
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/3.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import "MVTableView.h"
#import "MVTableViewCell.h"
#import "MV.h"
@interface MVTableView ()<UITableViewDataSource,UITableViewDelegate>






@end

@implementation MVTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;

    }
    return self;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *resuseIndentifier = @"cell1";
    
    MVTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseIndentifier];
    
    if (cell == nil) {
        cell = [[MVTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier];
    }
    
    cell.mv = self.array[indexPath.row];


    return cell;


}
-(void)setArray:(NSMutableArray *)array{

    _array = [NSMutableArray arrayWithArray:array];
    [self reloadData];
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return self.bounds.size.width / 100 * 77 ;
//
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.array.count;
}


@end
