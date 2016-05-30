//
//  FirstModel.swift
//  KiritoListMangerDemo
//
//  Created by kirito_song on 16/5/26.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

import UIKit

class FirstModel: NSObject {
    /* 页码 */
    var page = 1
    /* 请求url */
    var Dataurl : String?
    /* listmanager的Url、请求完毕刷新用*/
    var tableView : UITableView!
    /* 数据源 */
    var dataArray : Array<AnyObject>!
    /* 更多参数 */
    var parame : Dictionary<NSString,NSString>?
    
    
    
    /**
        翻页
     */
    func next() {
        self.page += 1
        self.loadData()
    }
    
    /**
        刷新
     */
    func freshenData()  {
        self.page = 1
        self.loadData()
    }
    
    
    func loadData()  {
        
        let url = String.init(format:"%s/p/%d", self.Dataurl!,self.page)
        print(url)
        //模拟请求数据
        self.dataArray = [["name" : "第一个"],["name" : "第二个"],["name" : "第三个"],["name" : "第四个"],["name" : "第五个"],["name" : "第六个"],["name" : "第七个"]]
        
        //请求完毕刷新tableView
        self.tableView.reloadData()
    }
    
    
    

}
