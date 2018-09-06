//
//  HowtoTableViewCell.swift
//  Ehomaki
//
//  Created by yakazu on 2018/01/14.
//  Copyright © 2018年 kazuhiro aonuma. All rights reserved.
//

import UIKit

class HowtoTableViewCell: UITableViewCell {

    @IBOutlet weak public var titleLabel: UILabel!
    @IBOutlet weak public var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
