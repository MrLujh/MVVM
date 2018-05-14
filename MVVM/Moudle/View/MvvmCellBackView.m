//
//  MvvmCellBackView.m
//  MVVM
//
//  Created by lujh on 2018/5/14.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "MvvmCellBackView.h"

@interface MvvmCellBackView ()
// 卡背景图片
@property (nonatomic, weak) UIImageView *cardImageView;
// 商铺名字
@property (nonatomic, weak) UILabel *shopNameView;
// 会员卡右上角图标
@property (nonatomic, weak) UIImageView *rightImageView;
// 商铺图片
@property (nonatomic, weak) UIImageView *shopImageView;
// 卡号
@property (nonatomic, weak) UILabel *cardNumberView;
@end

@implementation MvvmCellBackView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 添加所有子控件
        [self setUpAllChildView];
        
        self.userInteractionEnabled = YES;
       
    }
    return self;
}

// 添加所有子控件
- (void)setUpAllChildView
{
    // 商铺名字
    UILabel *shopNameView = [[UILabel alloc] init];
    shopNameView.font = Theme_Font_14;
    shopNameView.textColor = [UIColor whiteColor];
    [self addSubview:shopNameView];
    _shopNameView = shopNameView;
    
    // 会员卡右上角图标
    UIImageView *rightImageView = [[UIImageView alloc] init];
    [self addSubview:rightImageView];
    _rightImageView = rightImageView;
    
    // 商铺图片
    UIImageView *shopImageView = [[UIImageView alloc] init];
    [self addSubview:shopImageView];
    _shopImageView = shopImageView;
    
    // 卡号
    UILabel *cardNumberView = [[UILabel alloc] init];
    cardNumberView.font = Theme_Font_14;
    cardNumberView.textColor = [UIColor whiteColor];
    [self addSubview:cardNumberView];
    _cardNumberView = cardNumberView;
    
}

- (void)setModelF:(MvvmModelF *)modelF
{
    _modelF = modelF;
    
    // 设置frame
    [self setUpFrame];
    
    // 设置data
    [self setUpData];
}

- (void)setUpFrame
{
    // 商铺名字
    _shopNameView.frame = self.modelF.shopNameFrame;
    
    // 会员卡右上角图标
    _rightImageView.frame = self.modelF.rightImageFrame;
    
    // 商铺图片
    _shopImageView.frame = self.modelF.cardLogoFrame;
    _shopImageView.layer.cornerRadius = self.modelF.cardLogoFrame.size.height/2.0;
    _shopImageView.layer.masksToBounds = YES;
    
    // 卡号
    _cardNumberView.frame = self.modelF.cardNumberFrame;
    
}

- (void)setUpData
{
    
    MvvmModel *model = self.modelF.model;
    
    // 卡背景图片
    [self sd_setImageWithURL:[NSURL URLWithString:model.image]];
    
    
    // 商铺名字
    _shopNameView.text = model.shopsname;
    
    // 会员卡右上角图标
    [_rightImageView setImage:[UIImage imageNamed:@"kabao_card_info"]];
    
    // 商铺图片
    [_shopImageView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    
    // 卡号
    _cardNumberView.text = [NSString stringWithFormat:@"卡号：%@",model.cardnum];
}

@end
