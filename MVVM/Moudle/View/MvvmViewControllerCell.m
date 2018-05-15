//
//  MvvmViewControllerCell.m
//  MVVM
//
//  Created by lujh on 2018/5/14.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "MvvmViewControllerCell.h"
#import "MvvmCellBackView.h"

@interface MvvmViewControllerCell ()

@property (nonatomic, weak) MvvmCellBackView *cellBackView;

@end

@implementation MvvmViewControllerCell

#pragma mark -初始化frame

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"MvvmViewControllerCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    return cell;
}

// 注意：cell是用initWithStyle初始化

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 添加所有子控件
        [self setUpAllChildView];
        
        self.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    }
    
    return self;
    
}

#pragma mark -添加所有子控件

- (void)setUpAllChildView
{
    // cell背景view
    MvvmCellBackView *cellBackView = [[MvvmCellBackView alloc] init];
    [self addSubview:cellBackView];
    self.cellBackView = cellBackView;
}

/*
 问题：
 1.cell的高度应该提前计算出来
 2.cell的高度必须要先计算出每个子控件的frame，才能确定
 3.如果在cell的setStatus方法计算子控件的位置，会比较耗性能
 
 解决:MVVM思想
 M:模型
 V:视图
 VM:视图模型（模型包装视图模型，模型+模型对应视图的frame）
 */
- (void)setModelF:(MvvmModelF *)modelF
{
    _modelF = modelF;
   
    //设置卡frame
    self.cellBackView.frame = modelF.cellBackViewFrame;
    self.cellBackView.modelF = modelF;
}

@end
