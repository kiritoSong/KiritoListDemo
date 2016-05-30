//
//  ViewController.swift
//  KiritoListMangerDemo
//
//  Created by kirito_song on 16/5/26.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

import UIKit



/**
    FirstListManager设置成需要与一个FatModel绑定
    在配置好model后直接传入manager即可
 */
class ViewController: UIViewController,BaseListManagerDelegate {
    
    var listManager:FirstListManager?
    var listModel:FirstModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.title = "第一页"
        
        
        
        /**
            初始化一个ListVM
         */
        self.listModel = FirstModel()
        //设置url、让VM自动控制翻页、刷新
        self.listModel!.Dataurl = "www.baidu.com"
        
        self.listModel!.parame = ["isFirst":"1"]
        
        
        
        
        /**
            通过VM初始化一个manager
         */
        self.listManager = FirstListManager.init(frame: self.view.frame, listModel: self.listModel!)
        self.listManager?.delegate = self
        //  将需要展示的cell注册到manger.tableView中
        self.listManager!.tableView.registerClass(FirstTableViewCell.self, forCellReuseIdentifier: "cell0")
        self.view.addSubview((self.listManager?.tableView)!)
        
        
        
        
        /**
            配置完、让model刷新数据
         */
        self.listModel?.loadData()
    }

    
    
//    //可以在VC里颠覆listmanager的默认配置。比如manager复用很多、哪天需要单独配置修改一个页面的配置。就可以这样修改
//    func LMnumberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 5
//    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

