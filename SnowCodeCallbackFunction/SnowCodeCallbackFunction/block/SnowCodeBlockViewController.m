//
//  SnowCodeBlockViewController.m
//  SnowCodeCallbackFunction
//
//  Created by xue bai on 2018/4/3.
//  Copyright © 2018年 com.bl.DaoJia. All rights reserved.
//

#import "SnowCodeBlockViewController.h"
#import "SnowCodeGCDMulticastDelegateViewController.h"

@interface SnowCodeBlockViewController ()<SnowCodeGCDMulticastDelegateViewControllerDelegate>
@property (nonatomic, strong) UIButton *blockButton;

@end

@implementation SnowCodeBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.blockButton];
    
    SnowCodeGCDMulticastDelegateViewController *vc = [[SnowCodeGCDMulticastDelegateViewController alloc]init];
    vc.delegate = self;
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.blockButton.frame = CGRectMake((self.view.frame.size.width - 100)/2 , (self.view.frame.size.height - 50)/2, 100, 50);
}

#pragma mark -- SnowCodeGCDMulticastDelegateViewControllerDelegate
-(void)snowCodeGCDMulticastDelegateViewController:(SnowCodeGCDMulticastDelegateViewController *)snowCodeGCDMulticastDelegateVc withGCDMulticastDelegateButton:(UIButton *)delageteButton
{
    NSLog(@"two");
}

#pragma mark -- event
-(void)didTappBlockButton:(UIButton*)blockButton
{
    if (self.block) {
        self.block([UIColor brownColor]);
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark -- getter/setter
-(UIButton *)blockButton
{
    if (_blockButton == nil) {
        _blockButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_blockButton setTitle:@"block" forState:(UIControlStateNormal)];
        [_blockButton setBackgroundColor:[UIColor whiteColor]];
        [_blockButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_blockButton addTarget:self action:@selector(didTappBlockButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _blockButton;
}


@end
