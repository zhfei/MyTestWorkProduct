//
//  Person.swift
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/6/6.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

//前置运算符，表示2的var0次方
prefix operator ^
prefix func ^ ( var0: Double) -> Double{
    return pow(2, var0)
}
//后置运算符，表示var0的2次方
postfix operator ^
postfix func ^ (var0: Double) -> Double {
    return var0*var0
}


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
        
        print(^9)
    }
    
    
}
