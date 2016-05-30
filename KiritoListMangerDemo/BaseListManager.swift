//
//  BaseListManager.swift
//  KiritoListMangerDemo
//
//  Created by kirito_song on 16/5/26.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

import UIKit

@objc protocol BaseListManagerDelegate {
    
    /* 基类暴露给代理的协议方法、可以下放给代理自由颠覆实现、方便复用 */
    /* 推荐写在基类~省得子类再声明一次、然后这里只写了几个用到的、demo而已么~*/
    /* 实际工作中、一定会全写上的、看着好大一坨~*/

    optional  func LMtableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    optional  func LMnumberOfSectionsInTableView(tableView: UITableView) -> Int

    optional  func LMtableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    
}
class BaseListManager: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    /* 内嵌tableView */
    var tableView:UITableView!
    /* 代理对象 */
    var delegate :BaseListManagerDelegate!
    
    
    //没啥用、因为基本子类都会垫付一遍。不写会报错而已
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        return UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellID")
    }
    
    
    /**
        基类中只实现一个方法、初始化一个充要条件(tableView)、更多的东西尽量留给子类去扩展
     
     - parameter frame: tableView`s frame
     
     */
    init(frame:CGRect) {
        super.init()
        self.tableView = UITableView(frame: frame, style: UITableViewStyle.Plain)
        self.tableView!.delegate = self;
        self.tableView!.dataSource = self;
        self.tableView!.backgroundColor = UIColor.clearColor()
    }
}
