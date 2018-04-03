//
//  SonwCodeDelegateViewController.m
//  SnowCodeCallbackFunction
//
//  Created by xue bai on 2018/4/3.
//  Copyright © 2018年 com.bl.DaoJia. All rights reserved.
//

#import "SonwCodeDelegateViewController.h"

@interface SonwCodeDelegateViewController ()
@property (nonatomic, strong) UIButton *delagteButton;
@end

@implementation SonwCodeDelegateViewController

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
    if ([self.delegate respondsToSelector:@selector(sonwCodeDelegateViewController:withDeleagteButton:)]) {
        [self.delegate sonwCodeDelegateViewController:self withDeleagteButton:delegateButton];
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -- getter/setter
-(UIButton *)delagteButton
{
    if (_delagteButton == nil) {
        _delagteButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_delagteButton setTitle:@"delegate" forState:(UIControlStateNormal)];
        [_delagteButton setBackgroundColor:[UIColor whiteColor]];
        [_delagteButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_delagteButton addTarget:self action:@selector(didTappDelegateButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _delagteButton;
}


@end
