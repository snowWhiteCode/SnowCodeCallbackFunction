//
//  ViewController.m
//  SnowCodeCallbackFunction
//
//  Created by xue bai on 2018/4/2.
//  Copyright © 2018年 com.bl.DaoJia. All rights reserved.
//

#import "ViewController.h"
#import "SonwCodeDelegateViewController.h"
#import "SnowCodeBlockViewController.h"
#import "SnowCodeNotificationViewController.h"
extern NSString *const KViewControllerNotification;
extern NSString *const KTableViewBackgroundColorKVO;
NSString *const KTableViewBackgroundColorKVO = @"KTableViewBackgroundColorKVO";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,SonwCodeDelegateViewControllerDelegate>

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSString *strKVO;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceivedNotification:) name:KViewControllerNotification object:nil];
    
    
    self.strKVO = @"KVO";

    //注册监听
   /*  注意：KVO可监听具有setProperty的属性，通过继承重写父类的setProperty方法，插入willChangeValueForKey 和didChangeValueForKey通知；而且，只能监听到通过调用setProperty方法而引起值变化的场景;也就是说，直接修改成员值时，KVO是无能为力的*/
    [self.strKVO addObserver:self forKeyPath:KTableViewBackgroundColorKVO options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.tableview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

}

#pragma mark - 接收通知
-(void)didReceivedNotification:(NSNotification*)notification
{
    if ([notification.object isKindOfClass:[UIColor class]]) {
        self.tableview.backgroundColor = notification.object;
    }
}

#pragma mark - 实现KVO回调方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    /**
     *  当对象的属性发生改变会调用该方法
     *
     *  @param keyPath 监听的属性
     *  @param object  监听的对象
     *  @param change  新值和旧值
     *  @param context 额外的数据
     */
    NSLog(@"%@",self.strKVO);
    NSLog(@"%@  %@  %@  %@ ",keyPath,object,change,context);
}

-(void)dealloc
{/*销毁通知*/
    [[NSNotificationCenter defaultCenter] removeObserver:self name:KViewControllerNotification object:nil];
    
    /*销毁监听*/
    [self.strKVO removeObserver:self forKeyPath:KTableViewBackgroundColorKVO context:nil];
}

#pragma mark -- SonwCodeDelegateViewControllerDelegate
-(void)sonwCodeDelegateViewController:(SonwCodeDelegateViewController *)sonwCodeDelegateVc withDeleagteButton:(UIButton *)delageteButton
{
    self.tableview.backgroundColor = [UIColor redColor];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            SonwCodeDelegateViewController *vcDelegate = [[SonwCodeDelegateViewController alloc]init];
            vcDelegate.delegate = self;
            [self presentViewController:vcDelegate animated:YES completion:^{
                
            }];
        }
            break;
        case 1:{
            SnowCodeBlockViewController *backVc = [[SnowCodeBlockViewController alloc]init];
            backVc.block = ^(UIColor *color) {
               self.tableview.backgroundColor = color;
            };
            [self presentViewController:backVc animated:YES completion:^{
                
            }];
        }
            break;
        case 2:{
            SnowCodeNotificationViewController *vcNotification = [[SnowCodeNotificationViewController alloc]init];
            [self presentViewController:vcNotification animated:YES completion:^{
                
            }];
        }
            break;
        case 3:{
            self.strKVO = @"OK";
        }
            break;
            
        default:
            break;
    }
}
#pragma mark -- getter/setter
-(UITableView *)tableview
{
    if (_tableview == nil) {
        _tableview = [[UITableView alloc]initWithFrame:(CGRectZero) style:(UITableViewStylePlain)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [[UIView alloc]init];
        [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];

    }
    return _tableview;
}

-(NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[@"delegate",@"block",@"notification",@"KVO",@"多播委托"];
    }
    return _dataSource;
}


@end
