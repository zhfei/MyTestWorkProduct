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

//        lazy var names:[String] = {
//            //()->[String] in
//            return ["hw","xm"]
//        }()
        
        let mt = MathTool()
        let result = mt.add(num1: 10, num2: 10)
        print(result)
        
        
        let httpTool = HttpTool()
//        weak var weakSelf = self
//        httpTool.requestData { ()->() in
//            weakSelf?.view.backgroundColor = UIColor.red
//        }
        
//        httpTool.requestData { [weak self] ()->() in
//            self.view.backgroundColor = UIColor.red
//        }
        
        httpTool.requestData { [unowned self] ()->() in
            self.view.backgroundColor = UIColor.red
        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //MARK: - 点击事件
        let p = PersonClass(name: "ww", age: 18)
        print("name:\(p.name!), age:\(p.age)")
    }
    
    func loadWebView() -> Void {
        let url = URL(string: "www.baidu.com")
        let request = URLRequest(url: url!)
        
        let webView = UIWebView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, request, error) in
            print(error!)
        }
        
    }
}

extension SwiftViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        return cell
    }
    
    
}






