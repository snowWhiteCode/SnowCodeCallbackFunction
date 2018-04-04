//
//  SnowCodeGCDMulticastDelegateViewController.h
//  SnowCodeCallbackFunction
//
//  Created by xue bai on 2018/4/4.
//  Copyright © 2018年 com.bl.DaoJia. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SnowCodeGCDMulticastDelegateViewControllerDelegate;

@interface SnowCodeGCDMulticastDelegateViewController : UIViewController

@property (nonatomic, weak) id<SnowCodeGCDMulticastDelegateViewControllerDelegate>delegate;//声明协议变量

@end


@protocol SnowCodeGCDMulticastDelegateViewControllerDelegate<NSObject>//创建协议

-(void)snowCodeGCDMulticastDelegateViewController:(SnowCodeGCDMulticastDelegateViewController*)snowCodeGCDMulticastDelegateVc withGCDMulticastDelegateButton:(UIButton*)delageteButton;//声明协议方法

@end
