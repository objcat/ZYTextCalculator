//
//  ZYTextCalculator.m
//  MongolianReadProject
//
//  Created by 张祎 on 2017/8/24.
//  Copyright © 2017年 objcat. All rights reserved.
//

#import "ZYTextCalculator.h"

@interface ZYTextCalculator ()
@property (class, readonly) UILabel *label;
@end

typedef NS_ENUM(NSUInteger, ZYTextCalculateType) {
    ZYTextCalculateWidth,
    ZYTextCalculateHeight,
};

@implementation ZYTextCalculator

+ (UILabel *)label {
    static UILabel *label = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        label = [[UILabel alloc] init];
    });
    return label;
}

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing maxSize:(CGSize)maxSize numberOfLine:(NSInteger)numberOfLine {
    
    if (!lineSpacing) {
        lineSpacing = 0;
    }
    
    NSAttributedString *attributedString;
    
    if (lineSpacing) {
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        paragraph.lineSpacing = lineSpacing;
        attributedString = [[NSAttributedString alloc] initWithString:text ? : @"" attributes:@{NSParagraphStyleAttributeName: paragraph, NSFontAttributeName: font}];
    } else {
        attributedString = [[NSAttributedString alloc] initWithString:text ? : @"" attributes:@{NSFontAttributeName: font}];
    }
    
    return [ZYTextCalculator sizeWithText:attributedString maxSize:maxSize numberOfLine:numberOfLine];
}

+ (CGSize)sizeWithText:(NSAttributedString *)attributedString maxSize:(CGSize)maxSize numberOfLine:(NSInteger)numberOfLine {
    self.label.attributedText = attributedString;
    self.label.numberOfLines = numberOfLine;
    return [self.label sizeThatFits:maxSize];
}

@end
