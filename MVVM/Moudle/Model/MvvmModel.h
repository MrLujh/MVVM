//
//  MvvmModel.h
//  MVVM
//
//  Created by lujh on 2018/5/14.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MvvmModel : NSObject
//用户会员卡id
@property(nonatomic,copy)NSString *cardId;
//卡号
@property(nonatomic,copy)NSString *cardnum;
//折叠的图片
@property(nonatomic,copy)NSString *fold_img;
//卡类型：1、储值卡 2、计次卡
@property(nonatomic,copy)NSString *type;
//店铺名称
@property(nonatomic,copy)NSString *shopsname;
//店铺log
@property(nonatomic,copy)NSString *logo;
//余额
@property(nonatomic,copy)NSString *remain_total_price;
//是否可用 1、可用 2、不可用
@property(nonatomic,copy)NSString *is_use;
//卡背景图片
@property(nonatomic,copy)NSString *image;
//剩余次数
@property(nonatomic,copy)NSString *card_remain_nums;
//商店id
@property(nonatomic,copy)NSString *shopsid;
//卡名称
@property(nonatomic,copy)NSString *name;
//有效期类型：1、月 2、年 3、永久
@property(nonatomic,copy)NSString *expire_type;
//有效期时间
@property(nonatomic,copy)NSString *expire_time;
//添加时间
@property(nonatomic,copy)NSString *addtime;
@end
