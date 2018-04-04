//
//  SnowCodeGCDMulticastDelegateViewController.m
//  SnowCodeCallbackFunction
//
//  Created by xue bai on 2018/4/4.
//  Copyright © 2018年 com.bl.DaoJia. All rights reserved.
//

#import "SnowCodeGCDMulticastDelegateViewController.h"

@interface SnowCodeGCDMulticastDelegateViewController ()
@property (nonatomic, strong) UIButton *delagteButton;
@end

@implementation SnowCodeGCDMulticastDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.delagteButton];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.delagteButton.frame = CGRectMake((self.view.frame.size.width - 100)/2 , (self.view.frame.size.height - 50)/2, 100, 50);
}

#pragma mark -- event
-(void)didTappDelegateButton:(UIButton*)delegateButton
{
    if ([self.delegate respondsToSelector:@selector(snowCodeGCDMulticastDelegateViewController:withGCDMulticastDelegateButton:)]) {
        [self.delegate snowCodeGCDMulticastDelegateViewController:self withGCDMulticastDelegateButton:delegateButton];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -- getter/setter
-(UIButton *)delagteButton
{
    if (_delagteButton == nil) {
        _delagteButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_delagteButton setTitle:@"GCDMulticastDelegate" forState:(UIControlStateNormal)];
        [_delagteButton setBackgroundColor:[UIColor whiteColor]];
        [_delagteButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_delagteButton addTarget:self action:@selector(didTappDelegateButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _delagteButton;
}


@end

