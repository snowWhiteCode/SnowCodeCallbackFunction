//
//  SnowCodeNotificationViewController.m
//  SnowCodeCallbackFunction
//
//  Created by xue bai on 2018/4/3.
//  Copyright © 2018年 com.bl.DaoJia. All rights reserved.
//

#import "SnowCodeNotificationViewController.h"
NSString *const KViewControllerNotification = @"KViewControllerNotification";
@interface SnowCodeNotificationViewController ()
@property (nonatomic, strong) UIButton *notificationButton;

@end

@implementation SnowCodeNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.notificationButton];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.notificationButton.frame = CGRectMake((self.view.frame.size.width - 100)/2 , (self.view.frame.size.height - 50)/2, 100, 50);
}

#pragma mark -- event
-(void)didTappNotificationButton:(UIButton*)notificationButton
{
    /*发送通知*/
    [[NSNotificationCenter defaultCenter]postNotificationName:KViewControllerNotification object:[UIColor blueColor]];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -- getter/setter
-(UIButton *)notificationButton
{
    if (_notificationButton == nil) {
        _notificationButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_notificationButton setTitle:@"notification" forState:(UIControlStateNormal)];
        [_notificationButton setBackgroundColor:[UIColor whiteColor]];
        [_notificationButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_notificationButton addTarget:self action:@selector(didTappNotificationButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _notificationButton;
}
@end
