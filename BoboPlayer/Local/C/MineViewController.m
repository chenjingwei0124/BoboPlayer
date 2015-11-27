//
//  MineViewController.m
//  MPlayer
//
//  Created by SUN on 15/10/27.
//  Copyright (c) 2015年 孙海睿. All rights reserved.
//

#import "MineViewController.h"
#import "PicTableViewCell.h"
#import "UserTableViewCell.h"
#import "MusicListViewController.h"
#import "RecentlyTableViewCell.h"
#import "LikeTableViewCell.h"
#import "UIColor+AddColor.h"
#import "WebView.h"
#import "SongsViewController.h"
#import "WebViewController.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "UIScrollView+LJWZoomingHeader.h"
#import "TestZoomingHeaderView.h"
#import "SongListCell.h"
#import "SimpleSongsListTableViewController.h"
#import "DefaultSongsViewController.h"
#import "LoginViewController.h"
#import "UserInfoViewController.h"
#import "MVViewController.h"
#import "EveryWeekTableViewCell.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) TestZoomingHeaderView *headerView;
@property (nonatomic,retain) NSMutableArray *array;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.tableView =[[UITableView alloc]initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64 * 2)) style:(UITableViewStyleGrouped)];
    
    //
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor huiseColor];

    [self.tableView addZoomingHeaderView:[self testHeaderView]];

    
    
    [self.view addSubview:self.tableView];


    //islogin
    
}

#pragma mark - headerView
- (TestZoomingHeaderView *)testHeaderView
{
    //给出合适的高宽，乱来的话我也不知道会怎样~
    self.headerView = [[TestZoomingHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.headerView.backgroundColor = [UIColor orangeColor];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHeaderView:)];
    
    [self.headerView addGestureRecognizer:tapGesture];
    
    return self.headerView;
}



#pragma mark  topHeaderView  的轻触事件
-(void)tapHeaderView:(id)sender{

    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"设置背景图片" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"从相册选择",@"拍照", nil];
    [alertView show];
    

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        pickerImage.delegate = self;
        pickerImage.allowsEditing = YES;
        [self presentViewController:pickerImage animated:YES completion:nil];
    }
    
    if (buttonIndex == 2) {
        
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
            
        }
        
        pickerImage.delegate = self;
        pickerImage.allowsEditing = YES;

        [self presentViewController:pickerImage animated:YES completion:nil];
        
    }
    
    
}

-(void)saveImage:(UIImage *)image withImageName:(NSString *)imageName{

    NSData *imageData = UIImageJPEGRepresentation(image, 1);//缩放比例
    
    //获取沙盒路径
    NSString *fuilPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
    
    NSLog(@"saveImage %@",fuilPath);
    
//    图片写入文件
    [imageData writeToFile:fuilPath atomically:NO];

}

#pragma mark - 图片选择
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{

    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //保存图片至本地
    [self saveImage:image withImageName:@"chick.png"];
    
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"chick.png"];
    
    UIImage *savedImage = [[UIImage alloc]initWithContentsOfFile:fullPath];
    self.headerView.imageView.image = savedImage;
    NSLog(@"didFinish %@",fullPath);
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    


#pragma mark 设置 NSUserDefaults
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isImageChanged"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}


// confirms or cancels.
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];

}





#pragma mark - 设置Cell

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    if (indexPath.section == 0) {
        
        
        
        
        
        static NSString *resuseIndentifier = @"cell0";

        UserTableViewCell *cell = [[UserTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier];
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        BOOL isLoging = [ud boolForKey:@"isLogin"];
        if (isLoging == NO) {
            
            cell.userimageView.image = [UIImage imageNamed:@"iconfont-yonghu"];
            cell.userLabel.text = @"用户名";
        }else{
        
            cell.userimageView.image = [UIImage imageNamed:@"icon-touxiang.jpg"];

            cell.userLabel.text = @"Just Before I Go";
        
        }
        return cell;

    }
    if (indexPath.section == 1) {

        
        
        static NSString *resuseIndentifier = @"cell1";
        
        SongListCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseIndentifier];
        
        if (cell == nil) {
            cell = [[SongListCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier];
        }
        if (indexPath.row == 0) {
            cell.imageView1.image = [UIImage imageNamed:@"local"];
            cell.label1.text = @"默认播放列表";
        }
        if (indexPath.row == 2) {
            cell.imageView1.image = [UIImage imageNamed:@"mv"];
            cell.label1.text = @"MV";
        }
    
//        if (indexPath.row == 1) {
//            cell.imageView1.image = [UIImage imageNamed:@"iconfont-yinlezhuanti"];
//            cell.label1.text = @"最近播放";
//        }
        if (indexPath.row == 3) {
            cell.imageView1.image = [UIImage imageNamed:@"iconfont-yuleyinlediantai"];
            cell.label1.text = @"电台";
        }
        if (indexPath.row == 1) {
            cell.imageView1.image = [UIImage imageNamed:@"like"];
            cell.label1.text = @"我喜欢";
        }
        
    
        
        return cell;

        
        

    }
    
    
    if (indexPath.section == 2) {
        
        
        static NSString *resuseIndentifier = @"cell2";
        
        LikeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseIndentifier];
        
        if (cell == nil) {
            cell = [[LikeTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier] ;
        }
        cell.likeLabel.text = @"我的歌单";
        
        //图片为第一首歌的专辑图片
        cell.imageView1.image = [UIImage imageNamed:@"gedantupian"];
        
        return cell;

        
    
    }
    if (indexPath.section == 3) {
        static NSString *resuseIndentifier = @"cell5";

        EveryWeekTableViewCell *cell = [[EveryWeekTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier];
        cell.likeLabel.text = @"每周精彩推荐";

        return cell;
    }
    
    static NSString *resuseIndentifier = @"cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:resuseIndentifier];
    }
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
    
}





#pragma mark - Cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (indexPath.section == 0) {
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        BOOL isLoging = [ud boolForKey:@"isLogin"];
        if (isLoging == NO) {
        
            LoginViewController *loginVC = [[LoginViewController alloc]init];
            loginVC.view.backgroundColor = [UIColor whiteColor];
            [self presentViewController:loginVC animated:YES completion:nil];
            loginVC.reload = ^(void){
                [self.tableView reloadData];
            };
            
        }else{
            //用户资料页面
            
            UserInfoViewController *userInfoVC = [[UserInfoViewController alloc]init];
            userInfoVC.view.backgroundColor = [UIColor whiteColor];
            userInfoVC.reload = ^(void){
            
                [self.tableView reloadData];
            
            };
            userInfoVC.imageView.image = [UIImage imageNamed:@"icon-touxiang.jpg"];
            
            [self.navigationController pushViewController:userInfoVC animated:YES];
            
        }
        
        
    }
    
    
    if (indexPath.section == 1 ) {
        if (indexPath.row == 0) {

            DefaultSongsViewController *defaultSongsVC = [[DefaultSongsViewController alloc]init];
            defaultSongsVC.view.backgroundColor = [UIColor whiteColor];

            [self.navigationController pushViewController:defaultSongsVC animated:YES];
        
        
        }
        if (indexPath.row == 1) {
            DefaultSongsViewController *songsVC = [[DefaultSongsViewController alloc]init];
            songsVC.isCollect = YES;
            
            songsVC.view.backgroundColor = [UIColor whiteColor];
            UILabel *titlelabel = [[UILabel alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 2 - 50, self.headV.frame.size.height / 2 - 30 / 2 + 10, 100, 40))];
            titlelabel.text = @"我喜欢";
            titlelabel.font = [UIFont systemFontOfSize:20];
            titlelabel.textAlignment = YES;
            titlelabel.textColor = [UIColor whiteColor];
            [songsVC.headV addSubview:titlelabel];
            
            [self.navigationController pushViewController:songsVC animated:YES];
        }
        if (indexPath.row == 2) {
            NSLog(@"MV页面");
            
            MVViewController *MVVC = [[MVViewController alloc]init];
            MVVC.view.backgroundColor = [UIColor whiteColor];
            
            
            [self.navigationController pushViewController:MVVC animated:YES];
            
            
            
            
        }
        if (indexPath.row == 3) {
            NSLog(@"跳转到电台页面");
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"diantaiHR" object:nil];
        }
        
    }
    if (indexPath.section == 2) {
        
        
        //点击进入   我的歌单
        
        SimpleSongsListTableViewController *tableVC = [[SimpleSongsListTableViewController alloc]init];
        tableVC.view.backgroundColor = [UIColor whiteColor];
//        tableVC.array = self.array;
        UILabel *titlelabel = [[UILabel alloc]initWithFrame:(CGRectMake(self.view.frame.size.width / 2 - 50, self.headV.frame.size.height / 2 - 30 / 2 + 10, 100, 40))];
        titlelabel.text = @"我的歌单";
        titlelabel.font = [UIFont systemFontOfSize:20];
        titlelabel.textAlignment = YES;
        titlelabel.textColor = [UIColor whiteColor];
        [tableVC.headV addSubview:titlelabel];
        [self.navigationController pushViewController:tableVC animated:YES];
        
        
    }
    if (indexPath.section == 3) {
        
        WebViewController *webVC = [[WebViewController alloc]init];
        [self.navigationController pushViewController:webVC animated:YES];
        
    }




}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    return 4;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 1) {
        return 4;
    }
    else{
        return 1;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.section == 0) {
//        return self.view.bounds.size.height / 3;
//    }
    if (indexPath.section == 0) {
        return self.view.bounds.size.height / 10;
    }
    if (indexPath.section == 1) {
        return 50;
//        return self.view.bounds.size.height / 20 * 2;
    }
    if (indexPath.section == 2) {

        
        return self.view.bounds.size.height / 5;
    }
    if (indexPath.section == 3) {
        return self.view.bounds.size.height / 5;
    }else{
        return self.view.bounds.size.height / 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
