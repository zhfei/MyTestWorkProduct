//
//  SwiftViewController.swift
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/6/6.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

struct MathTool {
    func add(num1:Int,num2:Int) -> Int {
        return num1 + num2
    }
    func add(num1:Double,num2:Double) -> Double {
        return num1 + num2
    }
    func add(num1:Float,num2:Float,num3:Float) -> Float {
        return num1 + num2 + num3
    }
}

class SwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let mt = MathTool()
        let result = mt.add(num1: 10, num2: 10)
        print(result)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let p = PersonClass(name: "ww", age: 18)
        print("name:\(p.name!), age:\(p.age)")
    }

}
