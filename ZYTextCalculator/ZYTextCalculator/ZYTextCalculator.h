//
//  ZYTextCalculator.h
//  MongolianReadProject
//
//  Created by 张祎 on 2017/8/24.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYTextCalculator : NSObject
/**
 计算容纳size 使用方法 1.CGSizeMake(MAXFLOAT, 0) 2.CGSizeMake(控件宽度, MAXFLOAT)

 @param text 文字
 @param font 字体和大小
 @param lineSpacing 行间距      如果设置为0则使用系统默认行间距
 @param maxSize 最大容纳size    容纳size有两种使用方式  1.设置为 CGSizeMake(MAXFLOAT, 0) 则返回容纳字体的最合适高度和宽度 (单行) 2.设置为 CGSizeMake(控件宽度, MAXFLOAT) 则会返回 最接近控件宽度的宽度 和 容纳字体的完美容纳高度
 @return 容纳size
 */
+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize;
@end
