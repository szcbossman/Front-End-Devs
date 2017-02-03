//
//  CustomCell.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/28.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var text1_L: UILabel!
    @IBOutlet weak var text1_R: UILabel!
    @IBOutlet weak var text2_L: UILabel!
    @IBOutlet weak var btn2_R: UIButton!
    @IBOutlet weak var text3_L: UILabel!
    @IBOutlet weak var btn3_R: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
