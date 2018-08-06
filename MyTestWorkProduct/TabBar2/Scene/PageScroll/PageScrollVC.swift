//
//  PageScrollVC.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/7/17.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class PageScrollVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "分页滚动"
        
        let pgV = PageScrollView.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200))
        self.view.addSubview(pgV)
        
        
        let imageVs = ["coupon_placeholder","photo_","map0_"]
        let banner = SDCCycleScrollView(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 200), shouldInfiniteLoop: true, imageGroups: imageVs)
        banner?.autoScrollTimeInterval = 3;
        banner?.autoScroll = true;
        banner?.isZoom = true;
        banner?.itemSpace = 0;
        banner?.imgCornerRadius = 0;
        banner?.itemWidth = self.view.frame.size.width - 100;
        banner?.delegate = self;
        self.view.addSubview(banner!)
    }
    
}

extension PageScrollVC:DCCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCCycleScrollView!, didSelectItemAt index: Int) {
        print(index)
    }
    
    
}
