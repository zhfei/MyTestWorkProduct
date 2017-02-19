//
//  BoundFlowLayout.m
//  MyTestWorkProduct
//
//  Created by zhoufei on 16/6/3.
//  Copyright © 2016年 zhoufei. All rights reserved.
//

#import "BoundFlowLayout.h"

@implementation BoundFlowLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray * array =[super layoutAttributesForElementsInRect:rect];
    CGFloat offsetY=self.collectionView.contentOffset.y;
    
    CGFloat contentHeight=self.collectionViewContentSize.height;
    CGFloat contentBottom=self.collectionView.contentInset.bottom;
    CGFloat screenH      =self.collectionView.frame.size.height;
    
    CGFloat bottomOffSetY=offsetY+screenH-contentBottom-contentHeight;
    
    for (UICollectionViewLayoutAttributes *attributes in array) {
        if (attributes.representedElementCategory==UICollectionElementCategoryCell) {
            
           
            
            CGRect frame =attributes.frame;
            
            if (offsetY<0) {
                CGFloat distance = fabs(offsetY) / 20;
                frame.origin.y += offsetY + distance * (attributes.indexPath.section + 1);
            }
            
            if (bottomOffSetY>0) {
                CGFloat distance = fabs(bottomOffSetY) / 20;
                frame.origin.y += bottomOffSetY - distance * (self.collectionView.numberOfSections-attributes.indexPath.section);
            }
            
            attributes.frame=frame;
        }
    }
    
    return array;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

@end
