//
//  AxisFlowLayout.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/8/14.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class AxisFlowLayout: UICollectionViewFlowLayout {
    var sumCellWidth : CGFloat = 0.0
    let betweenOfCell: CGFloat = 0
    override init() {
        
        super.init()
        scrollDirection = UICollectionViewScrollDirection.horizontal
        itemSize = CGSize(width: 100, height: 40)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes_super : [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: rect) ?? [UICollectionViewLayoutAttributes]()
        let layoutAttributes:[UICollectionViewLayoutAttributes] = NSArray(array: layoutAttributes_super, copyItems:true)as! [UICollectionViewLayoutAttributes]
        var layoutAttributes_t : [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
        for index in 0..<layoutAttributes.count{
            
            let currentAttr = layoutAttributes[index]
            let previousAttr = index == 0 ? nil : layoutAttributes[index-1]
            let nextAttr = index + 1 == layoutAttributes.count ?
                nil : layoutAttributes[index+1]
            
            layoutAttributes_t.append(currentAttr)
            sumCellWidth += currentAttr.frame.size.width
            
            let previousY :CGFloat = previousAttr == nil ? 0 : previousAttr!.frame.maxY
            let currentY :CGFloat = currentAttr.frame.maxY
            let nextY:CGFloat = nextAttr == nil ? 0 : nextAttr!.frame.maxY
            
            if currentY != previousY && currentY != nextY{
                if currentAttr.representedElementKind == UICollectionElementKindSectionHeader{
                    layoutAttributes_t.removeAll()
                    sumCellWidth = 0.0
                }else if currentAttr.representedElementKind == UICollectionElementKindSectionFooter{
                    layoutAttributes_t.removeAll()
                    sumCellWidth = 0.0
                }else{
                    self.setCellFrame(with: layoutAttributes_t)
                    layoutAttributes_t.removeAll()
                    sumCellWidth = 0.0
                }
            }else if currentY != nextY{
                self.setCellFrame(with: layoutAttributes_t)
                layoutAttributes_t.removeAll()
                sumCellWidth = 0.0
            }
        }
        return layoutAttributes
    }
    
    /// 调整Cell的Frame
    ///
    /// - Parameter layoutAttributes: layoutAttribute 数组
    func setCellFrame(with layoutAttributes : [UICollectionViewLayoutAttributes]){
        var nowWidth : CGFloat = 0.0
        nowWidth = (self.collectionView!.frame.size.width - sumCellWidth - (CGFloat(layoutAttributes.count - 1) * betweenOfCell)) / 2
        for attributes in layoutAttributes{
            var nowFrame = attributes.frame
            nowFrame.origin.x = nowWidth
            attributes.frame = nowFrame
            nowWidth += nowFrame.size.width + self.betweenOfCell
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
