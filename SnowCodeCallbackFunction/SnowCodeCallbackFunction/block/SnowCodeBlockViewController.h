//
//  SnowCodeBlockViewController.h
//  SnowCodeCallbackFunction
//
//  Created by xue bai on 2018/4/3.
//  Copyright © 2018年 com.bl.DaoJia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnowCodeBlockViewController : UIViewController

@property(nonatomic, copy)void(^block)(UIColor *color);

@end
