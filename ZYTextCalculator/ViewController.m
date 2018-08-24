//
//  ViewController.m
//  ZYTextCalculator
//
//  Created by 张祎 on 2017/8/24.
//  Copyright © 2017年 张祎. All rights reserved.
//

#import "ViewController.h"
#import "ZYTextCalculator.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //创建scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20)];
    [self.view addSubview:scrollView];
    scrollView.alwaysBounceVertical = YES;
    scrollView.backgroundColor = [UIColor redColor];
    
    //创建label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
    [scrollView addSubview:label];
    label.font = [UIFont systemFontOfSize:16];
    label.backgroundColor = [UIColor cyanColor];
    label.numberOfLines = 0;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //设置行间距
    paragraphStyle.lineSpacing = 10;
    label.attributedText = [[NSAttributedString alloc] initWithString:TEXT attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
    
    
    /**  
     下面提供计算文字高度的完美解决方案
     大家在之前一定都在使用一个古老的方法   [string boundingRectWithSize]
     使用这个方法在计算文字的时候会出现诸多问题  如文字高度计算过长或过短
     
     有些人会在计算出来高度后 + 10 或 - 10 来适配文字的高度
     
     这样就十分不科学了
     
     所以我使用UILabel原生方法 封装了一个可以完美计算文字高度的方法
     
     下面提供了三种解决方案 请仔细阅读 欢迎纠正错误
     */

    /** 第一种方法 ZYTextCalculator */
    
    // 根据文字的宽度和字数 - 计算文字的高度
    CGSize size = [ZYTextCalculator sizeWithText:TEXT font:[UIFont systemFontOfSize:16] lineSpacing:10 maxSize:CGSizeMake(scrollView.frame.size.width, MAXFLOAT) numberOfLine:0];
    
    // 计算之后赋值于label和scrollView
    CGRect labelFrame = label.frame;
    labelFrame.size.height = size.height;
    label.frame = labelFrame;
    scrollView.contentSize = CGSizeMake(0, size.height);

    //到这里  可以注释掉 第一种方法  尝试 2 3 方法
    
    //第二种方法 SizeToFit
    
    //    [label sizeToFit];
    //    scrollView.contentSize = CGSizeMake(0, label.frame.size.height);
    
    //第三种方法 sizeThatFits
    
    //    CGSize size = [label sizeThatFits:CGSizeMake(label.frame.size.width, MAXFLOAT)];
    //    CGRect labelFrame = label.frame;
    //    labelFrame.size.height = size.height;
    //    label.frame = labelFrame;
    //    scrollView.contentSize = CGSizeMake(0, size.height);
    
    /**
     
     写到这里 有很多人有疑问  第二种和第三种系统方法那么好 尤其是第二种 那么简单 你为什么还要把它们封装呢?
     
     原因很简单  第二种和第三种方法 都离不开label对象本身
     
     设想一种情况  有一个collectionViewCell  你想根据里面的文字计算itemSize大小  但是cell中的label你是获取不到的
     
     说到这里 大家应该都懂了 
     
     最后一句话 欢迎踊跃纠正错误!

     */
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
