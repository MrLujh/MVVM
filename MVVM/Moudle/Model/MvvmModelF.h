//
//  MvvmModelF.h
//  MVVM
//
//  Created by lujh on 2018/5/14.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MvvmModel.h"

@interface MvvmModelF : NSObject
/** model */
@property (nonatomic,strong) MvvmModel *model;
// 卡背景图片
@property(nonatomic, assign) CGRect  cardImageViewFrame;

// 商铺名字Frame
@property (nonatomic, assign) CGRect shopNameFrame;

// 右上角图片Frame
@property (nonatomic, assign) CGRect rightImageFrame;

// 卡logoFrame
@property (nonatomic, assign) CGRect cardLogoFrame;

// 卡名字frame
@property (nonatomic, assign) CGRect cardNameFrame;

// 余额或次数Frame
@property (nonatomic, assign) CGRect moneyOrNumberFrame;

// 卡号Frame
@property (nonatomic, assign) CGRect cardNumberFrame;

// cell背景ViewFrame
@property (nonatomic, assign) CGRect cellBackViewFrame;

// cell的高度
@property (nonatomic, assign) CGFloat cellHeight;
@end
