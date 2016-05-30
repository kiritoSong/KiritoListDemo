//
//  SecondTableViewCell.swift
//  KiritoListMangerDemo
//
//  Created by kirito_song on 16/5/27.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    //实现以下代理方法
    override func configurationCell(dic: Dictionary<String, String>) {
        self.textLabel?.text = "第二页-------"+dic["nick"]!
    }
    
}
