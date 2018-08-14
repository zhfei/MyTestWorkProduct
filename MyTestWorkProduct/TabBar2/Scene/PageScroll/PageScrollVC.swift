//
//  PageScrollVC.swift
//  MyTestWorkProduct
//
//  Created by 周飞 on 2018/7/17.
//  Copyright © 2018年 zhoufei. All rights reserved.
//

import UIKit

enum SDCEnumType: Int {
    case circle = 20
    case check
    
    func enumTypeString(type: SDCEnumType) -> String {
        switch type {
        case .circle:
            return "circle"
        default:
            if type.rawValue == 21 {
                return "check"
            } else {
                return "其他情况"
            }
        }
    }
    
    enum SDCEnumSubType {
        case square(SDCEnumType)
        case ellipse(SDCEnumType)
    }
}

struct Animal {
    let region = "中国"
    var name: String?
    var color = UIColor.red
    
    init(name: String,color: UIColor) {
        self.name = name
        self.color = color
    }
    
    struct Dog {
        let legNum = 4
        func run() -> String {
            return "跑回家"
        }
    }
}


protocol Student {
    var name: String{get set}
    var age: Int {get}
    static func study(date:Date) -> Date
    
    init(name:String)
}
extension Student {
    var score:Float{
        return 80.8
    }
    
}
protocol Childe:Student {
    
}


class PageScrollVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "分页滚动"
        
        let pgV = PageScrollView.init(frame: CGRect.init(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 200))
        self.view.addSubview(pgV)
        
        
        let imageVs = ["coupon_placeholder","photo_","map0_"]
        let banner = SDCCycleScrollView(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 200), shouldInfiniteLoop: true, imageGroups: imageVs)
        banner?.autoScrollTimeInterval = 3;
        banner?.autoScroll = true;
        banner?.isZoom = true;
        banner?.itemSpace = 0;
        banner?.imgCornerRadius = 0;
        banner?.itemWidth = self.view.frame.size.width - 100;
        banner?.delegate = self;
        self.view.addSubview(banner!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
    }
    
}

extension PageScrollVC:DCCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCCycleScrollView!, didSelectItemAt index: Int) {
        print(index)
    }
    
    
}

struct IntStack{
    var items = [Int]()
    //压栈
    mutating func push(item:Int){
        items .append(item)
    }
    //出栈
    mutating func pop()->Int{
        return items.removeLast()
    }
}

struct Stack<Ele>{
    var items = [Ele]()
    mutating func push(item:Ele){
        items.append(item)
    }
    mutating func pop()->Ele{
        return items.removeLast()
    }
}










