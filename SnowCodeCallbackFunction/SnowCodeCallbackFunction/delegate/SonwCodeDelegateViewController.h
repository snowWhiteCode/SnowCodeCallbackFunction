//
//  SonwCodeDelegateViewController.h
//  SnowCodeCallbackFunction
//
//  Created by xue bai on 2018/4/3.
//  Copyright © 2018年 com.bl.DaoJia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SonwCodeDelegateViewControllerDelegate;

@interface SonwCodeDelegateViewController : UIViewController

/*
 对于weak: 指明该对象并不负责保持delegate这个对象，delegate这个对象的销毁由外部控制。(当delegate指向的对象销毁后，delegate = nil)
 
 对于strong：该对象强引用delegate，外界不能销毁delegate对象，会导致循环引用(Retain Cycles)
 
 对于assing：也有weak的功效。但是assign是指针赋值，不对引用计数操作，使用之后如果没有置为nil，可能就会产生野指针；而weak一旦不进行使用后，永远不会使用了，就不会产生野指针。( assing声明一个delegate，那么即便delegate指向的对象销毁了，delegate中依然会保存之前对象的地址即，delegate成为了一个野指针)
 */
@property (nonatomic, weak) id<SonwCodeDelegateViewControllerDelegate>delegate;//声明协议变量

@end


@protocol SonwCodeDelegateViewControllerDelegate<NSObject>//创建协议
-(void)sonwCodeDelegateViewController:(SonwCodeDelegateViewController*)sonwCodeDelegateVc withDeleagteButton:(UIButton*)delageteButton;//声明协议方法
@end
