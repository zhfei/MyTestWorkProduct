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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
