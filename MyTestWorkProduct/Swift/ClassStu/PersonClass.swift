//
//  Person.swift
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/6/6.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class PersonClass: NSObject {

    var name:String?
    var age:Int = 0
    
    override init() {
        print("初始化init")
    }
    
    init(name:String, age:Int) {
        
    }
    
    init(dict:[String:Any]) {
        self.name = dict["name"] as? String
        self.age = dict["age"] as! Int
        
    }
}
