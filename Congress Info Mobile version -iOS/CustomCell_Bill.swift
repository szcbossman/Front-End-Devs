//
//  CustomCell_Bill.swift
//  CongressInfo
//
//  Created by song zicheng daily use on 2016/11/29.
//  Copyright © 2016年 song zicheng. All rights reserved.
//

import UIKit

class CustomCell_Bill: UITableViewCell {

    @IBOutlet weak var billTitle: UILabel!
    @IBOutlet weak var BillText: UITextView!
    @IBOutlet weak var BillDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
