//
//  ViewController.m
//  MVVM
//
//  Created by lujh on 2018/5/14.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "ViewController.h"
#import "MvvmViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVM开发模式";
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    pushBtn.center = self.view.center;
    [pushBtn setTitle:@"pushMVVMVC" forState:UIControlStateNormal];
    pushBtn.backgroundColor = [UIColor redColor];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushBtn];
    
}


- (void)pushBtnClick
{
    MvvmViewController *VC = [[MvvmViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
