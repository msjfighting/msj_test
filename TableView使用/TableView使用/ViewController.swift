//
//  ViewController.swift
//  TableView使用
//
//  Created by zlhj on 2018/7/19.
//  Copyright © 2018年 zlhj. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{
    // MARK: 懒加载的属性   相当于#pragma mark

    lazy var tableView : UITableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.frame = view.bounds
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellid)
        }
        cell?.textLabel?.text = "测试数据\(indexPath.row)"
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\(indexPath.row)")
    }

}

