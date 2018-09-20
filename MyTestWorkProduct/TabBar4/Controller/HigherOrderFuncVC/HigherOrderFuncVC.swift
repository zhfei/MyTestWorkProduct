//
//  HigherOrderFuncVC.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/9/20.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class HigherOrderFuncVC: UIViewController {

    @IBOutlet weak var flag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flag.image = UIImage(named: self.assist)
    }

    override func viewDidAppear(_ animated: Bool) {
        
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
