//
//  UILabel+YYAdditions.h
//  YY
//
//  Created by liguowei on 14-10-14.
//  Copyright (c) 2014年 itbox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YYAdditions)
/**
 *  快速创建一个UILabel
 *
 *  @param text            text
 *  @param frame           frame
 *  @param font            font
 *  @param textAlignment   textAlignment
 *  @param color           color
 *  @param backgroundColor backgroundColor
 *
 *  @return UILabel
 */
+ (UILabel *)labelWithtext:(NSString *)text frame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)textAlignment;
@end
