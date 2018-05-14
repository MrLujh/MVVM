//
//  MvvmViewControllerCell.h
//  MVVM
//
//  Created by lujh on 2018/5/14.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MvvmModelF.h"

@interface MvvmViewControllerCell : UITableViewCell
/** modelF */
@property (nonatomic,strong) MvvmModelF *modelF;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
