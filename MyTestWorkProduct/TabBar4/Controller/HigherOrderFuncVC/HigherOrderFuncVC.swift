//
//  HigherOrderFuncVC.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/9/20.
//  Copyright © 2018年 zhoufei. All rights reserved.
//
// 何为高价函数：
// 定义一个函数，在参数列表中包含了不少于一个函数变量，也叫函数式编程

import UIKit

class HigherOrderFuncVC: UIViewController {

    @IBOutlet weak var flag: UIImageView!
    
    lazy var strArr: [Any] = {
        let arr: [Any] = ["hello","22","kite","33",10]
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flag.image = UIImage(named: self.assist)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        testMap()
//        testFlatMap()
//        testFilter()
        testReduce()
    }

    // MARK: - map
    private func testMap() {
        let strA = ["Hello", "kite", "Welcom", "COME"]
        let res = strA.map { (str) -> String in
            str.lowercased()
        }
        print("res:\(res)")
        //大写
        let res0 = strA.map { $0.uppercased() }
        print("res0:\(res0)")
        //字符个数
        let res1 = strA.map { $0.count }
        print("res1:\(res1)")
        //每个字符拼接
        let res2 = strA.map { "\($0)"+"22" }
        print("res2:\(res2)")
        //长度判断
        let res3 = strA.map { (str) -> String? in
            if  str.count>4 {
                return str
            } else {
                return nil
            }
        }
        print("res3:\(res3)")
    }
    
    // MARK: - flatMap:解包，去空，降维
    private func testFlatMap() {
        let strA = ["567", "99", "", "22234"]
        let res = strA.map { (str) -> Int? in
            if str.count > 0 {
                return Int(str)
            } else {
                return nil
            }
        }
        print("res:\(res)")
        
        let res0 = strA.compactMap { (str) -> Int? in
            if str.count > 0 {
                return Int(str)
            } else {
                return nil
            }
        }
        print("res0:\(res0)")
        
        let strB = [["11","22","33"], ["99","88","77"], ["2","3","4"], ["999"]]
        let res1 = strB.map { (obj) -> Any in
            return obj
        }
        print("res1:\(res1)")
        
        let res2 = strB.flatMap{ $0 }
        print("res2:\(res2)")
        let res3 = strB.compactMap{ $0 }
        print("res3:\(res3)")
    }
    
    // MARK: - Filter 返回符合条件的结果
    private func testFilter() {
        let strA = ["Hello", "kite", "Welcom", "COME"]
        //长度判断
        let res3 = strA.filter {
            $0.count>4
        }
        print("res3:\(res3)")
    }
    
    // MARK: - Reduce 对数组的两个元素$0+$1操作
    private func testReduce() {
        let strA = ["Hello","", "kite", "Welcom", "COME"]
        //长度判断
        let res3 = strA.reduce("") { (str0, str1) -> String in
            return str0+","+str1
        }
        print("res3:\(res3)")
        
        let res4 = strA.reduce("",+)
        print("res4:\(res4)")
        
        let res5 = strA.reduce("",{$0+$1})
        print("res5:\(res5)")
        
        let res6 = strA.reduce("",{ (str0, str1) -> String in
            return str0.isEmpty ? str1 : str0+"-"+str1
        })
        print("res6:\(res6)")
    }
}
