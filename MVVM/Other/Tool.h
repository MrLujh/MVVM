//
//  Tool.h
//  PocketShop
//
//  Created by zhuhao on 14-6-24.
//  Copyright (c) 2014年 strongunion. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Tool : NSObject
//计算文字的CGSize
+ (CGSize)calculteTheSizeWithContent:(NSString*)content rect:(CGSize)rect font:(UIFont*)font;
//计算文字的高度
+(CGRect)boundRectWithSize:(NSString*)text size:(CGSize)size attributes:(NSDictionary*)dic;
//验证字符串是否为空
+(BOOL)validateString:(NSString*)string;

//获取uuid
+(NSString*) uuid ;
//浮点数处理并去掉多余的0
+(NSString *)stringDisposeWithDouble:(double)dValue;

+(NSString *)notRounding:(double)price afterPoint:(int)position;

//格式话小数 只舍不入
+ (NSString *) decimalwithFormat:(NSString *)format  floatV:(double)floatV;
//四舍五入
+ (NSString *) decimalwithFormat2:(NSString *)format  floatV:(double)floatV;

//调整行间距
+ (NSAttributedString*)setWordLinesWithText:(NSString*)text Space:(int)space;

//改变label某个字体大小颜色
+ (NSAttributedString*)setLabelTextFont:(UIFont*)font Uicolor:(UIColor*)color  TextStr:(NSString*)str NsMakeRange:(int)start NsMakeRangeLength:(NSUInteger)length;

//舍去小数后面的零
+ (NSString*)isNsstringZero:(NSString*)str;

//将日期字符串按指定格式输出
+ (NSString*)dataFromString:(NSString*)date fromFormatter:(NSString*)fromFormatter  toFormatter:(NSString*)toFormatter;


//时间格式转换1
+ (NSString*)changeTimeYMDFormat:(NSString*)time;

//时间格式转换2
+ (NSString*)changeTimeYMDHMSWithNsstring:(NSString*)str;

//时间格式转换3
+ (NSString*)changeTimeYMDHMWithNsstring:(NSString*)str;

//HTML格式转换
+(NSString *)filterHTML:(NSString *)html;

//移除view上的子控件
+ (void)removeSubView:(UIView*)view;
@end
