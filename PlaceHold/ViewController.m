//
//  ViewController.m
//  PlaceHold
//
//  Created by zhYch on 2018/8/22.
//  Copyright © 2018年 zhaoyongchuang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 200, 105)];
    imageView.image = [self placeholderImageWithSize:imageView.frame.size];
    [self.view addSubview:imageView];
}


- (UIImage *)placeholderImageWithSize:(CGSize)size {
    
    // 占位图的背景色
    UIColor *backgroundColor = [UIColor colorWithRed:242 / 255.0 green:242 / 255.0 blue:242 / 255.0 alpha:1.0];
    // 中间LOGO图片
    UIImage *image = [UIImage imageNamed:@"image_logo"];
    
    //重点: 此处控制占位图的宽高，以最短边为标准乘以合适的比例
    CGFloat scaleSize = 0.0;
    if (size.width / size.height <= 1.3) {
        scaleSize = 0.6;
    }else {
        scaleSize = 0.7;
    }
    
    // 根据占位图需要的尺寸 计算 中间LOGO的宽高
    CGFloat logoWH = (size.width > size.height ? size.height : size.width) * scaleSize;
    CGSize logoSize = CGSizeMake(logoWH, logoWH);
    // 打开上下文
    UIGraphicsBeginImageContextWithOptions(size,0, [UIScreen mainScreen].scale);
    // 绘图
    [backgroundColor set];
    UIRectFill(CGRectMake(0,0, size.width, size.height));
    CGFloat imageX = (size.width / 2) - (logoSize.width / 2);
    CGFloat imageY = (size.height / 2) - (logoSize.height / 2);
    [image drawInRect:CGRectMake(imageX, imageY, logoSize.width, logoSize.height)];
    UIImage *resImage =UIGraphicsGetImageFromCurrentImageContext();
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return resImage;
    
}




@end
