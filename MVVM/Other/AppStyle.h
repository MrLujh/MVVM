//
//  AppStyle.h
//  PocketShop
//
//  Created by zhuhao on 14-3-26.
//  Copyright (c) 2014年 jkrm. All rights reserved.
//

#ifndef PocketShop_AppStyle_h
#define PocketShop_AppStyle_h

#define IPHONE_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define IPHONE_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define UIScreenHeight  [[UIScreen mainScreen]bounds].size.height
#define UIScreenWidth   [[UIScreen mainScreen]bounds].size.width

/**
 适配比例系数
 */
#define ScaleWidth [[UIScreen mainScreen] bounds].size.width/375.0

#define RGB(r,g,b)      [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


#define ViewController_BackGround [UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0]//视图控制器背景颜色

#define LINE_BACKGROUND [UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0]          //分割线背景颜色

#define Nav_BAR_ITEM_COLOR [UIColor whiteColor]

#define Nav_BAR_ITEM_FONT  [UIFont systemFontOfSize:17]

//app 黑色字体， 主题色
#define BASED_TEXT_BLACK_COLOR  RGB(99, 99, 99)

//发现页面的底部文字颜色
#define DiscoverText_color  RGB(99, 99, 99)


#define BASED_VIEW_BG_COLOR  RGB(200, 0, 32)

#define BASED_VIEW_BOLDER_COLOR        RGB(206, 206, 206).CGColor  //view 边框色
//白色背景色
#define BackgroundColor_WhiteColor  [UIColor whiteColor]
//不能选择的背景颜色
#define Theme_defaultColor   RGB(243,243,243)
//不能选择的颜色
#define Theme_noOperation RGB(153,153,153)
//价格的颜色
#define Price_color RGB(199,70,0)
//代金券的颜色
#define Coupon_color RGB(169,132,0)
//不符合代金券要求的颜色
#define Coupon_doNot_color RGB(191,191,191)
//添加优惠券按钮上的字颜色
#define Coupon_addBtn_color RGB(255,83,123)
//nav的颜色
#define navColor RGB(248,248,248)
//支持在线的背景色
#define onlinePayColor RGB(255,178,148)
//支持配送的背景色
#define sendGoodColor RGB(132,242,135)
//支持代金券的背景色
#define couponColor RGB(253,184,202)

//********************************************首页使用尺寸
#define kStateBar 20            //状态栏高度
#define kNavigationBar 44       //导航栏的高度
#define kTabbar  49             //工具栏的高度
#define kNavDistance ios7?64:44    //顶部的高度

#define MarginLR   10   //左右边距
#define MarginBT   10   //上下间距

/**
 *  导航栏字体
 */

#define Nav_Back_Font_M [UIFont systemFontOfSize:14]
//#define Theme_NavFont_M [UIFont systemFontOfSize:15]

/**
 *  app 主题 颜色
 */

#define Theme_Color_Green  RGB(87,195,28)
#define Theme_Color_Pink RGB(255,83,123)
#define Theme_Color_White [UIColor whiteColor]


#define Theme_NavColor   RGB(255,255,255)

#define Theme_ContentColor_XL [UIColor blackColor]
//#define Theme_ContentColor_L RGB(98,106,125)  //大标题
//#define Theme_ContentColor_M RGB(102,102,102)
//#define Theme_ContentColor_S RGB(153,153,153)


//#define Theme_ContentColor_L RGB(52,52,52)     // #343434
#define Theme_ContentColor_L RGB(17,17,17)     // #111111
//#define Theme_ContentColor_M RGB(128,128,128) //#808080
#define Theme_ContentColor_M RGB(102,102,102)
#define Theme_ContentColor_S RGB(153,153,153)
#define Theme_ContentColor_H RGB(136,136,136) //#88888



/**
 *  app 主题 颜色
 */

#define Theme_Color_Red  RGB(231,56,55)
#define Theme_Color_Pink RGB(255,83,123)
#define Theme_Color_White [UIColor whiteColor]

#define Theme_Color_Orange RGB(255,178,148)
#define Theme_Color_Peach RGB(253,184,202)


#define Theme_NavColor   RGB(255,255,255)

#define Theme_TextColor RGB(55,65,75)  //

#define Theme_LightGrayColor RGB(191,191,191)  //我的

//提交订单颜色
#define Theme_Color_disable  RGB(215,215,215)
#define Theme_Color_normal   RGB(98,106,125)

//cycleLine
#define Theme_CycleLine      RGB(204,204,204)



/**
 *  文本文字 三个大小
 */

#define Theme_ContentFont_S [UIFont systemFontOfSize:12]
#define Theme_ContentFont_M [UIFont systemFontOfSize:14]
#define Theme_ContentFont_L [UIFont systemFontOfSize:16]
#define Theme_ContentFont_XL [UIFont systemFontOfSize:18]


#define Theme_ContentFont_10 [UIFont fontWithName:@"Heiti SC" size:10.0]
#define Theme_ContentFont_11 [UIFont fontWithName:@"Heiti SC" size:11.0]
#define Theme_ContentFont_15 [UIFont systemFontOfSize:15]



/*
 * 字体大小
 */
#define Theme_Font_10 [UIFont systemFontOfSize:10]
#define Theme_Font_11 [UIFont systemFontOfSize:11]
#define Theme_Font_12 [UIFont systemFontOfSize:12]
#define Theme_Font_13 [UIFont systemFontOfSize:13]
#define Theme_Font_14 [UIFont systemFontOfSize:14]
#define Theme_Font_15 [UIFont systemFontOfSize:15]
#define Theme_Font_16 [UIFont systemFontOfSize:16]
#define Theme_Font_17 [UIFont systemFontOfSize:17]
#define Theme_Font_18 [UIFont systemFontOfSize:18]
#define Theme_Font_20 [UIFont systemFontOfSize:20]
#define Theme_Font_22 [UIFont systemFontOfSize:22]
#define Theme_Font_30 [UIFont systemFontOfSize:30]

#define Theme_Font_11_bold     [UIFont boldSystemFontOfSize:11]
#define Theme_Font_12_bold     [UIFont boldSystemFontOfSize:12]
#define Theme_Font_13_bold     [UIFont boldSystemFontOfSize:13]
#define Theme_Font_14_bold     [UIFont boldSystemFontOfSize:14]
#define Theme_Font_15_bold     [UIFont boldSystemFontOfSize:15]
#define Theme_Font_16_bold     [UIFont boldSystemFontOfSize:16]
#define Theme_Font_17_bold     [UIFont boldSystemFontOfSize:17]

/*
 * 系统配置
 */
//1.sys字体大小
//标题大小
#define KTitleFont      [UIFont boldSystemFontOfSize:16]

//1.sys字体颜色
//标题颜色
#define KTitleColor      RGB(225,225,225)

//2.sys颜色
//导航栏颜色
#define kNavigationBarBg  RGB(206,8,2) //#ce0802
//标题颜色
#define kTitleViewTextColor RGB(225,225,225)

//分割线颜色
#define Theme_LineColor        RGB(225,225,225)

#define Theme_LineColor2       RGB(237,237,237)

#define Theme_Line_Height        0.5

#define Theme_Line_Font        0.5




//首页
//首页字体
#define KHomePageTitleFont      [UIFont boldSystemFontOfSize:16]
//最上面定位地址与前面图标间隔
#define kLocationIconMarginTitle 20
//titleView高度
#define kTitleViewHeight 25
//定位地址右边的小图标
#define kTitleLabelRightIconWidth  8
#define kTitleLabelRightIconHeight 5

//我的
//
#define kMyViewCellColor RGB(52,52,52)

#define kBlueColor RGB(25, 117, 184) //例如：语音验证码


//#define kTabbarNormalColor   RGB(52,52,52) //#343434
#define kTabbarNormalColor   RGB(17,17,17)     // #111111

#define kTabbarSelectColor   RGB(206,8,2)  //#ce0802

//首页图片之间分割线颜色
#define KHomeLineColor      RGB(221,221,221)

//商品列表，左右视图比例
#define kLeftScale   0.25
#define kRightScale  0.75

#define NAV_BAR_COLOR [UIColor colorWithRed:214.0/255.0 green:31.0/255.0 blue:46.0/255.0 alpha:1.0]//导航条颜色
#define textcolor [UIColor colorWithRed:211.0/255.0  green:145.0/255.0 blue:0.0 alpha:1.0];
//标题颜色
#define BIAOTI_TEXTCOLOR [UIColor colorWithRed:92.0/255 green:92.0/255 blue:92.0/255 alpha:1];

#define CUTI_FONT [UIFont fontWithName:@"TrebuchetMS-Bold" size:16] //粗体

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#endif
