//
//  MvvmModelF.m
//  MVVM
//
//  Created by lujh on 2018/5/14.
//  Copyright © 2018年 lujh. All rights reserved.
//
#define VoucherModelFCellMargin 12
#define CardViewRightAndLeftMargin 1.5*VoucherModelFCellMargin
#define CardViewHeigth 167*ScaleWidth

#import "MvvmModelF.h"

@implementation MvvmModelF

- (void)setModel:(MvvmModel *)model
{
    _model = model;
    
    // 计算cell背景ViewFrame
    [self setUpCardViewFrame];
    
    // 计算cell高度
    self.cellHeight = CGRectGetMaxY(self.cellBackViewFrame) + VoucherModelFCellMargin;
    
}

#pragma mark -计算cardviewFrame

- (void)setUpCardViewFrame {
    
    // cardView
    CGFloat cardViewX = VoucherModelFCellMargin;
    CGFloat cardViewY = cardViewX;
    CGFloat cardViewW = UIScreenWidth - 2*VoucherModelFCellMargin;
    
    // 商铺名字
    CGFloat shopNameX = CardViewRightAndLeftMargin;
    CGFloat shopNameY = shopNameX*ScaleWidth;
    CGSize shopNameSize = [Tool calculteTheSizeWithContent:self.model.shopsname rect:CGSizeMake(300, CGFLOAT_MAX) font:Theme_Font_14];
    self.shopNameFrame = (CGRect){{shopNameX,shopNameY},shopNameSize};
    
    // 会员卡右上角图标
    CGFloat rightImageWH = 20*ScaleWidth;
    CGFloat rightImageY = CardViewRightAndLeftMargin*ScaleWidth;
    CGFloat rightImageX = cardViewW -CardViewRightAndLeftMargin -rightImageWH;
    self.rightImageFrame = CGRectMake(rightImageX, rightImageY, rightImageWH, rightImageWH);
    
    // 商铺图片
    CGFloat shopLogoImageX = shopNameX;
    CGFloat shopLogoImageWH = 74*ScaleWidth;
    CGFloat shopLogoImageY = (CardViewHeigth -shopLogoImageWH )/2;
    self.cardLogoFrame = CGRectMake(shopLogoImageX, shopLogoImageY, shopLogoImageWH, shopLogoImageWH);
    
    // 卡号
    CGFloat cardNumberX = shopNameX;
    NSString *cardNumberStr = [NSString stringWithFormat:@"卡号：%@",self.model.cardnum];
    CGSize cardNumberSize = [Tool calculteTheSizeWithContent:cardNumberStr rect:CGSizeMake(400, CGFLOAT_MAX) font:Theme_Font_14];
    CGFloat cardNumberY =CardViewHeigth -cardNumberSize.height*1.7;
    self.cardNumberFrame = (CGRect){{cardNumberX,cardNumberY},cardNumberSize};
    
    // cell背景View
    CGFloat cardViewH = CardViewHeigth;
    self.cellBackViewFrame = CGRectMake(cardViewX, cardViewY, cardViewW, cardViewH);
}

@end
