//
//  FirstListManager.swift
//  KiritoListMangerDemo
//
//  Created by kirito_song on 16/5/26.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

import UIKit



@objc protocol FirstListManagerCellDelegate {
    /**
     cell、配置的协议方法
     其实怎么写都可以、我这里是把尽可能多的东西、交给下一级的cell去选用。尽量减少manager里无关的逻辑处理、方便复用manager
     - parameter model:     VM(这里是FirstModel)
     - parameter indexPath: indexPath、这样在cell里。model.arr[row/section]就可以自己选择取用了。当然也可以拿来控制些其他的东西
     - parameter target:    代理、如果你的cell需要代理传递事件
        这三个要素基本就可以配置绝大部分cell了。
        更多的东西可以交给model.parame 去传递。比如作用于哪个页面啊、需要什么特殊标记啊之类
     */
    optional func configurationCell(model: FirstModel ,indexPath:NSIndexPath ,target:AnyObject)
}

//让cell遵从协议
extension UITableViewCell:FirstListManagerCellDelegate {
    
    
    func configurationCell(model: FirstModel ,indexPath:NSIndexPath ,target:AnyObject)  {
        
    }
}




/**
    listmanager尽量不要写太多判断。不然将来复用的地方越来越多。
    manager也会越来越臃肿、毕竟只是思想不是轮子。没必要面面俱到
    既然已经封装了。干脆可以封装几种不同环境的manager。
 */

class FirstListManager: BaseListManager {
    /* 此listmanager只需要一个VM即可实现、数据操作下放给VM*/
    var listModel : FirstModel!
    
    
    

    init(frame: CGRect ,listModel :FirstModel) {
        super.init(frame: frame)
        /**
            把listModel和talbeView双向绑定。
         */
        self.listModel = listModel
        self.listModel.tableView = self.tableView
    }
    
    //应该是MJ刷新
    func next() {
        self.listModel.next()
    }
    //应该是MJ刷新
    func freshenData()  {
        self.listModel.freshenData()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        if ((self.delegate!.LMtableView?(tableView, numberOfRowsInSection: section)) != nil) {
            return self.delegate!.LMtableView!(tableView, numberOfRowsInSection: section)
        }
        
        return self.listModel.dataArray!.count
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        if ((self.delegate!.LMnumberOfSectionsInTableView?(tableView)) != nil) {
            return self.delegate!.LMnumberOfSectionsInTableView!(tableView)
        }
        
        return 1;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        
        //讲道理OC中应该是   UITableViewCell<BaseListManagerCellDelegate> * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        //但是swift里好像不能这么写、所以在上面写了个 extension
        let cell : UITableViewCell  = tableView.dequeueReusableCellWithIdentifier("cell0")!
        
        
        //cell已经遵从了FirstListManagerCellDelegate协议。直接调取协议方法就可以配置不同的cell
        cell .configurationCell(self.listModel, indexPath: indexPath, target: self.delegate)
        return cell
        
    }

    
    
    
    
}
