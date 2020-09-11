//
//  NextTableViewCell.swift
//  mvvm-ios
//
//  Created by Robert Wan on 21/1/2020.
//  Copyright © 2020 Accenture. All rights reserved.
//

import UIKit

class NextTableViewCell: UITableViewCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
