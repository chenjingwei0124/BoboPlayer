//
//  AddSongsListViewController.h
//  UI_BoboPlayer
//
//  Created by SUN on 15/11/2.
//  Copyright © 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddSongsListViewController;

@protocol AddSongsListViewControllerDeleagte <NSObject>

-(void)AddSongsListViewControllerBackFront:(AddSongsListViewController *)secondVC textFieldText:(NSString *)text;



@end

@interface AddSongsListViewController : UIViewController
@property (nonatomic, strong)UIView *headV;
@property (nonatomic, strong)UIButton *backB;
@property (nonatomic, strong)UIButton *searchB;

@property (nonatomic,assign) id<AddSongsListViewControllerDeleagte> delegate;
@end
