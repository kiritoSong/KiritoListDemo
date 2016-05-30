//
//  SecondViewController.swift
//  KiritoListMangerDemo
//
//  Created by kirito_song on 16/5/26.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

import UIKit


/**
    第二页就不用model了、直接给manager绑定个数据源
    毕竟第一页的VM可以自动实现翻页、刷新、删除等动作
    但如果觉得第一页listManager与VM耦合较高。
    或者并不想去复用、只想要几种列表的布局配置、减轻VC中各种if判断列表样式的压力。
    干脆写成第二页这样也是可以的~
 */
class SecondViewController: UIViewController , BaseListManagerDelegate{

    
    var listManager:SecondListManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        
        
        self.title = "第二页"
        
        self.setupListManager()
        
        self.loadDate()
        
        
        
    }

    
    func setupListManager()  {
        /**
         和第一页差不多
         */
        self.listManager = SecondListManager.init(frame: self.view.frame)
        self.listManager?.delegate = self
        //  将需要展示的cell注册到manger.tableView中
        self.listManager!.tableView.registerClass(FirstTableViewCell.self, forCellReuseIdentifier: "cell0")
        self.listManager!.tableView.registerClass(SecondTableViewCell.self, forCellReuseIdentifier: "cell1")
        self.view.addSubview((self.listManager?.tableView)!)

    }

    func loadDate () {
        let arr = [["name" : "第一个","nick" : "第1个"],["name" : "第二个","nick" : "第2个"],["name" : "第三个","nick" : "第3个"],["name" : "第四个","nick" : "第4个"],["name" : "第五个","nick" : "第5个"],["name" : "第六个","nick" : "第6个"],["name" : "第七个","nick" : "第7个"]]
        
        self.listManager!.dataArray = arr
        
        
    }
    
    
    
    // MARK: -  BaseListManagerDelegate
    //这里可以选择实现Base代理方法、对listmanager默认配置进行颠覆
    
    func LMnumberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (self.listManager!.dataArray?.count)!
    }
    
    func LMtableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func LMtableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView.init()
        view.backgroundColor = UIColor.orangeColor()
        return view
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
