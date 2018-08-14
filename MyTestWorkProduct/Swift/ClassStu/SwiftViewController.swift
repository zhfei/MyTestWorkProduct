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
        
        let sum: ((Int,Int) -> Int) = {(a, b) in
            return a + b
        }
        let res = sum(1, 2)
        print(res)
        
        
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


//------------------------------

import Foundation
import NetworkExtension

public class VPNConnect {
    private static let vpnDescription = "DNS OnDemand to GoogleDNS"
    private static let vpnServerDescription = "OnDemand DNS to GoogleDNS"
    
    public var manager:NETunnelProviderManager = NETunnelProviderManager()
    public var dnsEndpoint:String = "8.8.8.8"
    
    public var connected:Bool {
        get {
            return self.manager.isOnDemandEnabled
        }
        set {
            if newValue != self.connected {
                update(
                    body: {
                        self.manager.isEnabled = newValue
                        self.manager.isOnDemandEnabled = newValue
                        
                },
                    complete: {
                        if newValue {
                            do {
                                try (self.manager.connection as? NETunnelProviderSession)?.startVPNTunnel(options: nil)
                            } catch let err as NSError {
                                NSLog("(err.localizedDescription)")
                            }
                        } else {
                            (self.manager.connection as? NETunnelProviderSession)?.stopVPNTunnel()
                        }
                }
                )
            }
        }
    }
    
    public init() {
        refreshManager()
    }
    
    public func refreshManager() -> Void {
        NETunnelProviderManager.loadAllFromPreferences(completionHandler: { (managers, error) in
            if nil == error {
                if let managers = managers {
                    for manager in managers {
                        if manager.localizedDescription == VPNConnect.vpnDescription {
                            self.manager = manager
                            return
                        }
                    }
                }
            }
            self.setPreferences()
        })
    }
    
    private func update(body: @escaping ()->Void, complete: @escaping ()->Void) {
        manager.loadFromPreferences { error in
            if (error != nil) {
                NSLog("Load error: (String(describing: error?.localizedDescription))")
                return
            }
            body()
            self.manager.saveToPreferences { (error) in
                if nil != error {
                    NSLog("vpn_connect: save error (error!)")
                } else {
                    complete()
                }
            }
        }
    }
    
    private func setPreferences() {
        //自定义协议设置
        self.manager.localizedDescription = VPNConnect.vpnDescription
        let proto = NETunnelProviderProtocol()
        proto.providerBundleIdentifier = "com.popmedic.vpntunnel.provider"
        proto.serverAddress = VPNConnect.vpnServerDescription
        self.manager.protocolConfiguration = proto
        //自定义连接规则
        let evaluationRule = NEEvaluateConnectionRule(matchDomains:["TLDList.tlds"], andAction: NEEvaluateConnectionRuleAction.connectIfNeeded)
        evaluationRule.useDNSServers = [self.dnsEndpoint]
        let onDemandRule = NEOnDemandRuleEvaluateConnection()
        onDemandRule.connectionRules = [evaluationRule]
        onDemandRule.interfaceTypeMatch = NEOnDemandRuleInterfaceType.any
        self.manager.onDemandRules = [onDemandRule]
    }
}


