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
    
}

- (IBAction)pushBtnClick:(UIButton *)sender
{
    MvvmViewController *VC = [[MvvmViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
