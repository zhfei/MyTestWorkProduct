//
//  HideNagationBarVC2.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/8/28.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class HideNagationBarVC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
