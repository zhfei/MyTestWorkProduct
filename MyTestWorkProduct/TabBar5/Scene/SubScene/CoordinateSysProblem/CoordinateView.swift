//
//  CoordinateView.swift
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/10/25.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

enum CoordinateType {
    case UIGraphics
    case UIBezierPath
}

class CoordinateView: UIView {
    
    var _coordinateType: CoordinateType = CoordinateType.UIBezierPath
    var coordinateType: CoordinateType {
        get {
            return _coordinateType
        }
        set {
            _coordinateType = newValue
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        let height = rect.size.height
        let width = rect.size.width
        let partAnglewidth: CGFloat = 15
        let partAngleheight: CGFloat  = 10
        let arcRadius = height*0.3
        let arcCenter = CGPoint(x: width*0.5, y: height*0.5)
        let atts = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16),
                    NSAttributedStringKey.foregroundColor:UIColor.blue]
        
        let content = UIGraphicsGetCurrentContext()
        //水平线
        content?.move(to: CGPoint(x: 0, y: height*0.5))
        content?.addLine(to: CGPoint(x: width, y: height*0.5))
        
        content?.addLine(to: CGPoint(x: width-partAnglewidth, y: height*0.5-partAngleheight))
        content?.move(to: CGPoint(x: width, y: height*0.5))
        content?.addLine(to: CGPoint(x: width-partAnglewidth, y: height*0.5+partAngleheight))
        NSString(string: "X").draw(at: CGPoint(x: width-partAnglewidth, y: height*0.5+partAngleheight), withAttributes: atts)
        
        //垂直线
        content?.move(to: CGPoint(x: width*0.5, y: height))
        content?.addLine(to: CGPoint(x: width*0.5, y: 0))
        
        content?.addLine(to: CGPoint(x: width*0.5-partAngleheight, y: partAnglewidth))
        content?.move(to: CGPoint(x: width*0.5, y: 0))
        content?.addLine(to: CGPoint(x: width*0.5+partAngleheight, y: partAnglewidth))
        NSString(string: "Y").draw(at: CGPoint(x: width*0.5+partAngleheight, y: 0), withAttributes: atts)
        
        //圆
        var des: String = ""
        switch _coordinateType {
        case .UIGraphics:
            des = "UIGraphicsGet..、顺时针、0～1.5PI"
            content?.move(to: CGPoint(x: width-arcRadius, y: height*0.5))
            content?.addArc(center: arcCenter, radius: arcRadius, startAngle: 0, endAngle: CGFloat(M_PI*1.5), clockwise: true)
        case .UIBezierPath:
            des = "UIBezierPath、顺时针、0～1.5PI"
            let bez = UIBezierPath(arcCenter: arcCenter, radius: arcRadius, startAngle: 0, endAngle: CGFloat(M_PI*1.5), clockwise: true)
            content?.addPath(bez.cgPath)
        }
        NSString(string: des).draw(in: CGRect(x: 2, y: 2, width: width*0.4, height: height*0.5), withAttributes: atts)
        
        content?.strokePath()
        
    }

}
