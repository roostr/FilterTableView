//
//  MineralTableViewCell.swift
//  FilterTableViewWithButton
//
//  Created by G R-Titko on 10/30/18.
//  Copyright © 2018 GRT-Programs. All rights reserved.
//

import UIKit

class MineralTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var labelType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
