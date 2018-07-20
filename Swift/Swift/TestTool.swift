//
//  TestTool.swift
//  SwiftDemo
//
//  Created by zlhj on 2018/7/19.
//  Copyright © 2018年 zlhj. All rights reserved.
//

import UIKit

class TestTool: NSObject {
    //闭包类型:(参数列表) -> (返回值类型)
    var callBack : ((_ jsonData:String)->())?
    
    func loadData(callBack : @escaping (_ jsonData : String)->()){
        self.callBack = callBack
        DispatchQueue.global().async {
            print("发送网络请求")
            DispatchQueue.main.async {
                print("获取到数据")
                callBack("123")
            }
        }
    }
}
