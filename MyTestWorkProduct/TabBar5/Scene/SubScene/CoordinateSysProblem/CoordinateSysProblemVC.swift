//
//  CoordinateSysProblemVC.swift
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/10/25.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class CoordinateSysProblemVC: UIViewController {

    @IBOutlet weak var topCoordinate: CoordinateView!
    @IBOutlet weak var bottomCoordinate: CoordinateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topCoordinate.coordinateType = .UIGraphics
        bottomCoordinate.coordinateType = .UIBezierPath
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
