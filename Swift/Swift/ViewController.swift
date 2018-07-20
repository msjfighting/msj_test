//
//  ViewController.swift
//  Swift
//
//  Created by zlhj on 2018/7/18.
//  Copyright © 2018年 zlhj. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    struct Reactangle {
        var width = 0.0;
        var height = 0.0;
        //定义对角线长度并且只读
        var diagonal:Double{
            get{
                return sqrt(width*width+height*height)
            }
        }
        // 周长的计算实例属性
        var perimeter:Double{
            return 2.0*(width+height)
        }
        // 面积
        var area:Double{
            return width*height;
        }
    }
    //计算式属性
    func run1(){
        // 创建一个实例对象
        var rect = Reactangle()
        rect.width = 3.0
        rect.height = 4.0;
        
        print("diagonal=\(rect.diagonal)")
        print("perimeter=\(rect.perimeter)")
        print("area=\(rect.area)")
    }
    // 属性观察者
    // 当指定属性要被修改前,会调用他设定的willset方法;当指定属性已经被修改之后则会调用它所设定的didset方法
    struct Test {
        var number:Float{
            willSet{
                print("current value is:\(number)")
                print("Specified value is:\(newValue)")
                
                
                number = -100.0
            }
            didSet {
                var value = number == 0.0 ? 0.00001 : number
                number = oldValue/value
            }
            
        }
        init(value: Float){
            number = value
        }
    }
    func run2() -> Void {
        var test = Test(value: 1.0)
        test.number = 0.0
        print("The number is \(test.number)")
        
    }
    var tools:TestTool = TestTool()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("点击页面");
        // 解决循环引用的方式1:weakSelf?.view  如果前面的可选类型没有值,后面的代码不会执行
/*        weak var weakSelf = self
          tools.loadData { (jsonData) ->() in
          weakSelf?.view.backgroundColor = UIColor.red
        }*/
        // 解决循环引用方式2: 推荐使用
       
        tools.loadData {[weak self] (jsonData) ->() in
          self?.view.backgroundColor = UIColor.red
        }
        // 解决循环引用方式3:unowned
         /*
        tools.loadData {[unowned self] (jsonData) ->() in
            self.view.backgroundColor = UIColor.red
        }
     */
    }
    deinit {
        // 相当于oc中的dealloc方法
        print("销毁ViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
        
//        self.run2()
//        self .test7();

    }
//        loadData{(result) in
//            print("获取json信息\(result)")
//        }

//        doSometing {
//            print("逃逸闭包")
//        }
//        doSometing2{
//            return "叔叔,我们不约"
//        }
//        print(comletionHandle())
    
    
    var comletionHandle:()->String = {"约吗?"}
    func doSometing2(some:@escaping ()->String) {
        comletionHandle = some
    }
    
    func doSometing(some:@escaping () ->Void){
        // 延时操作
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1){
            some()
        }
        print("函数体")
        
    }
    
    func test7() -> Void {
        let name = ["s","b","g","f","h"]
        var result = name.sorted(by:backwards)
        print(result)
    }
    func backwards(a1:String,a2:String) -> Bool {
        return a1<a2;
    }
//    逃逸闭包“@escaping”一般用于异步函数的回调
    func loadData(completion: @escaping (_ result: [String])->()) -> (){
        DispatchQueue.global().async {
            print("耗时操作\(Thread.current)")
            Thread.sleep(forTimeInterval:1.0)
            let json=["12","23","34"]
            DispatchQueue.main.async { execute:do {
                    print("主线程\(Thread.current)")
                    completion(json)
                }
            }
        }
    }
    // 字典转数组
    func test6() -> Void {
        let someDic:[Int:String] = [1:"one",2:"two",3:"three"]
        let dicKeys = [Int](someDic.keys)
        let dicValues = [String](someDic.values)
        print("输出字典的key:")
        
        for (key) in dicKeys {
            print("\(key)")
        }
        print("输出字典的value:")
        
        for (value) in dicValues {
            print("\(value)")
        }
    }
    // 遍历字典  enumerated返回的是字典的索引及 (key, value) 对
    func test5() -> Void {
        let someDic:[Int:String] = [1:"one",2:"two",3:"three"];
        for (key,value) in someDic.enumerated() {
            print("字典key\(key)--字典(key,value)对\(value)");
        }
    }
    // 移除字典的某个value
    func test4() -> Void {
        var someDic:[Int:String] = [1:"one",2:"two",3:"three"];
        let old = someDic.removeValue(forKey: 2); // old 是修改前的值
        print("key =2的值\(someDic[2])");
    }
    // 修改字典的值
    func test3() -> Void {
        var someDic:[Int:String] = [1:"one",2:"two",3:"three"];
        let old = someDic.updateValue("one 的新值", forKey: 1);
        let some = someDic[1];
        print("key =1旧值\(old)");
        print("key=1新值\(some)");
    }
    func test1() -> Void {
        // 可在声明可选变量的时候使用!代替? 这样可选变量在使用的时候不用加上!来获取值
        var myStr:String?;
        myStr = "hello swift";
        if myStr != nil{
            // 使用!之前一定要确保可选包含一个非空的值
            print(myStr!);
        }else{
            print("字符串为空");
        }
    }
    func test2() -> Void {
       // 可选绑定 来判断可选变量是否有值,如果有值,则会将可选变量赋值给一个常量或者变量
        var myStr:String?;
        myStr = "hello";
        if let str = myStr {
            print("\(str)");
        }else{
            print("字符串为空");
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

