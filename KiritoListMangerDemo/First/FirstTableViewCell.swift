//
//  FirstTableViewCell.swift
//  KiritoListMangerDemo
//
//  Created by kirito_song on 16/5/27.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {


    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    /**
     cell遵从了FirstListManagerCellDelegate 协议。颠覆协议方法给listmanager调用自动配置cell
     */
    override func configurationCell(model: FirstModel, indexPath: NSIndexPath, target: AnyObject) {
        if ((model.parame!["isFirst"]?.intValue) == 1) {
            self.textLabel!.text = "第一页------"+(model.dataArray[indexPath.row]["name"] as! String)
        }else {
            self.textLabel!.text = "第二页------"+( model.dataArray[indexPath.row]["name"] as! String)
        }
    }
    
    
    //第二页listmanager也使用了这个cell。自然要实现second的代理方法
    override func configurationCell(dic: Dictionary<String, String>) {
        self.textLabel?.text = "第二页-------"+dic["name"]!
    }


}
