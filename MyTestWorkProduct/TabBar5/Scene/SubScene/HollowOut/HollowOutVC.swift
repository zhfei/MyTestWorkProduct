//
//  HollowOutVC.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/6/15.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class HollowOutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.layer.contents = UIImage.init(named: "Duck")?.cgImage
        
        self.addHollowOutLayer()
    }

    func addHollowOutLayer() {
        
        let margin:CGFloat = 50.0
        let bvW = UIScreen.main.bounds.size.width-2*margin;
        let bvH = UIScreen.main.bounds.size.height-4*margin;
        
        let backView = UIView.init(frame: CGRect.init(x: margin, y: margin*2, width: bvW, height: bvH))
        backView.backgroundColor = UIColor.lightGray
        backView.alpha = 0.8
        
        self.view.addSubview(backView)
        
        let bep = UIBezierPath.init(roundedRect:  CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width-2*margin, height: UIScreen.main.bounds.size.height-4*margin), cornerRadius: 5.0)
        
        let bep2 = UIBezierPath.init(arcCenter: CGPoint(x: bvW*0.5, y: bvH*0.5), radius: 50, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise:false)
        
        bep.append(bep2)
        let shaplayer = CAShapeLayer.init()
        shaplayer.path = bep2.cgPath
        //mask范围内的内容才能展现
        backView.layer.mask = shaplayer
        
    }


}
