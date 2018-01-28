//
//  DIYCollectionViewLayout.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/3/21.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "DIYCollectionViewLayout.h"

#define kTopMargin 10
#define kItemWidth 100
#define kLeftMargin 10

@interface DIYCollectionViewLayout()

@end

@implementation DIYCollectionViewLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
   NSMutableArray* attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    for (int i=0; i<[attributes count]; i++) {
        UICollectionViewLayoutAttributes *attr = [attributes objectAtIndex:i];

        
        if (attr.frame.origin.x==kLeftMargin) {
            continue;
        }else{
          UICollectionViewLayoutAttributes *subAttr = [attributes objectAtIndex:i-1];
            attr.frame=CGRectMake(CGRectGetMaxX(subAttr.frame)+20, attr.frame.origin.y, attr.frame.size.width, attr.frame.size.height);
        }
        
    }
    
    for (UICollectionViewLayoutAttributes *attr in attributes)
    {
        NSLog(@"%@", NSStringFromCGRect([attr frame]));
    }
       
    return attributes;
}

@end
