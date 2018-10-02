//
//  TableViewCell.swift
//  Registration Form with Core Data
//
//  Created by Admin on 09/07/1940 Saka.
//  Copyright © 1940 Kapil. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var firstNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
