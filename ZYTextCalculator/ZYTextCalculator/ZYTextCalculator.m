//
//  ZYTextCalculator.m
//  MongolianReadProject
//
//  Created by 张祎 on 2017/8/24.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import "ZYTextCalculator.h"

typedef NS_ENUM(NSUInteger, ZYTextCalculateType) {
    ZYTextCalculateWidth,
    ZYTextCalculateHeight,
};

@implementation ZYTextCalculator

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize {
    ZYTextCalculator *calculator = [[ZYTextCalculator alloc] init];
    return [calculator sizeWithText:text font:font lineSpacing:lineSpacing maxSize:maxSize];
}

- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize {
    NSAttributedString *attributedString;
    
    if (lineSpacing) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineSpacing = lineSpacing;
        attributedString = [[NSAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName: paragraph}];
    } else {
        attributedString = [[NSAttributedString alloc] initWithString:text attributes:@{}];
    }
    
    return [self sizeWithText:attributedString maxSize:maxSize font:font];
}

- (CGSize)sizeWithText:(NSAttributedString *)attributedString maxSize:(CGSize)maxSize font:(UIFont *)font {
        UILabel *label;
        label = [[UILabel alloc] init];
        label.attributedText = attributedString;
        label.font = font;
        label.numberOfLines = 0;
        return [label sizeThatFits:maxSize];
}

@end
