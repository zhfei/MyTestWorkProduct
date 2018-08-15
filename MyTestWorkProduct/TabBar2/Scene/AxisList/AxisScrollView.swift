//
//  AxisView.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/8/15.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

var leftMargin:CGFloat = 50
let btnWidth:CGFloat = 40
var btnHeigh:CGFloat = btnWidth
var btnMargin:CGFloat = 100
var viewWidth:CGFloat = 0

protocol AxisScrollViewDelegate {
    func AxisScrollViewDidSelectedBtn(_ btn: UIButton)
}

class AxisScrollView: UIView {

    let dataSouce = ["1","2","3"]
    var scrollView = UIScrollView()
    var selectedBtn: UIButton?
    var delegate: AxisScrollViewDelegate?
    override init(frame: CGRect) {
        scrollView.frame = frame
        super.init(frame: frame)
        self.addSubview(scrollView)
        leftMargin = (frame.size.width - btnWidth)*0.5
        viewWidth = frame.size.width
        
        scrollView.isPagingEnabled=false;
        scrollView.clipsToBounds=false;
        scrollView.bounces=true;
        scrollView.isScrollEnabled = false
        scrollView.showsHorizontalScrollIndicator=true;

        scrollView.contentSize = CGSize(width: (leftMargin+btnWidth+btnMargin)*CGFloat(2) + btnWidth , height: frame.size.height)
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        
        resetView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func resetView() {
        var count = 0
        let flag = 100
        for str in dataSouce {
            let btn = UIButton(type: UIButtonType.custom)
            btn.tag = flag + count
            btn.frame = CGRect(x: leftMargin+(btnWidth+btnMargin)*CGFloat(count), y: 0, width: btnWidth, height: btnHeigh)
            btn.setTitle(str, for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setTitleColor(UIColor.white, for: .selected)
            btn.layer.cornerRadius = btn.bounds.size.width*0.5
            btn.layer.masksToBounds = true
            btn.layer.backgroundColor = UIColor.lightGray.cgColor
            btn.addTarget(self, action: #selector(btnClickAction(_:)), for: UIControlEvents.touchUpInside)
            scrollView.addSubview(btn)
            count += 1
        }
        
        let startBtn = scrollView.viewWithTag(100)
        let endBtn = scrollView.viewWithTag(102)
        
        
        let line = UIView()
        line.frame = CGRect(x: (startBtn?.center.x)!, y: (startBtn?.center.y)!, width: ((endBtn?.center.x)! - (startBtn?.center.x)!), height: 0.5)
        scrollView.insertSubview(line, at: 0)
        line.backgroundColor = UIColor.lightGray
        
        btnClickAction(startBtn as! UIButton)
    }
    
    @objc func btnClickAction(_ sender: UIButton) {
        scrollView.setContentOffset(CGPoint(x: sender.center.x - viewWidth*0.5, y: 0), animated: true)
        
        if let selectBtn = selectedBtn {
            btnUnSelected(selectBtn)
        }
        btnSelected(sender)
        selectedBtn = sender
        delegate?.AxisScrollViewDidSelectedBtn(sender)
    }
    
    func btnSelected(_ btn:UIButton) {
        btn.isSelected = true
        btn.layer.insertSublayer(gradientLayer, at: 0)
        btn.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    func btnUnSelected(_ btn:UIButton) {
        btn.isSelected = false
        gradientLayer.removeFromSuperlayer()
        btn.transform = CGAffineTransform.identity
    }
    
    lazy var gradientLayer:CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.bounds=CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth);
        layer.position = CGPoint(x: btnWidth*0.5, y: btnWidth*0.5);
        
        let startColor = UIColor(red: 14/255.0, green: 176/255.0, blue: 233/255.0, alpha: 1)
        let endColor = UIColor(red: 42/255.0, green: 227/255.0, blue: 235/255.0, alpha: 1)
        
        layer.colors = [startColor.cgColor,endColor.cgColor]
        layer.locations = [0,1]
        layer.startPoint = CGPoint.zero;
        layer.endPoint = CGPoint(x: 1, y: 1);
        return layer
    }()

}

extension AxisScrollView:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
}
