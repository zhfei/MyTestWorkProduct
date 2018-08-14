//
//  Dog.swift
//  MyTestWorkProduct
//
//  Created by zhoufei on 2018/6/6.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

class Dog: NSObject {
    let origin: String = "中国"
    fileprivate var name: String?
    private var age: Int?
    
    init(_ name: String?, age: Int = 1) {
        self.name = name ?? "旺财"
        self.age = age
    }
}
