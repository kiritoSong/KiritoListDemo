//
//  SecondListManager.swift
//  KiritoListMangerDemo
//
//  Created by kirito_song on 16/5/27.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

import UIKit



@objc protocol SecondListManagerCellDelegate {
    /**
     cell、配置的协议方法
     second应该属于一个订制的manager吧、我也说不好。
     总之意思就是想说cell配置方法可以根据自己具体需要去订制。
     如果这个manager并不需要在很多地方复用、完全可以只把数据源传递进去
     */
    optional func configurationCell(dic:Dictionary<String,String>)
}

//我不嫌累~让cell再遵从协议
extension UITableViewCell:SecondListManagerCellDelegate {
    
    
    func configurationCell(dic:Dictionary<String,String>)  {
        
    }
}


class SecondListManager: BaseListManager {
    
    
    
    
    /**
     *  第二个manager 不要model了。有个数据源就得了
     */

    
    var dataArray :Array<AnyObject>? {
        
        didSet {
            //set之后、刷新tableView
            self.tableView.reloadData()
            
        }
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //如果代理实现了对应方法、则以代理方法为准、否则按基础配置
        if ((self.delegate!.LMtableView?(tableView, numberOfRowsInSection: section)) != nil) {
            return self.delegate!.LMtableView!(tableView, numberOfRowsInSection: section)
        }
        
        return self.dataArray!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //如果代理实现了对应方法、则以代理方法为准、否则按基础配置
        if ((self.delegate!.LMnumberOfSectionsInTableView?(tableView)) != nil) {
            return self.delegate!.LMnumberOfSectionsInTableView!(tableView)
        }
        
        return 1;
    }
    
    
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        //如果代理实现了对应方法、则以代理方法为准、否则按基础配置
        //VC写出来、这里可以注销看效果
        if ((self.delegate!.LMtableView?(tableView, viewForFooterInSection: section)) != nil) {
            return self.delegate!.LMtableView!(tableView, viewForFooterInSection: section)
        }
        
        let view = UIView.init()
        view.backgroundColor = UIColor.blueColor()
        return view
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

       let cell_x : AnyObject
        
        if indexPath.row == 0 {
            let cell : UITableViewCell  = tableView.dequeueReusableCellWithIdentifier("cell0")!
            cell.configurationCell(self.dataArray![indexPath.row] as! Dictionary<String, String>)
            cell_x = cell
        }else {
            let cell : UITableViewCell  = tableView.dequeueReusableCellWithIdentifier("cell1")!
            cell.configurationCell(self.dataArray![indexPath.row] as! Dictionary<String, String>)
            cell_x = cell

        }

        return cell_x as! UITableViewCell
        
    }
    


    
}
