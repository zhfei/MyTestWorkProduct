//
//  AxisListViewController.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/8/14.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class AxisListViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var bottomContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let flowLayout = AxisFlowLayout()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 50, height: 50)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        
        let vc = AxisCollectionVC(collectionViewLayout: flowLayout)
        self.addChildViewController(vc)
        contentView.addSubview(vc.view)
        vc.view.mas_makeConstraints { (maker) in
            maker?.edges.equalTo()(UIEdgeInsets.zero)
        }
        
        
        
        
        
        let scroll = AxisScrollView(frame: bottomContainer.bounds)
        bottomContainer.addSubview(scroll)

        // Do any additional setup after loading the view.
    }
}








