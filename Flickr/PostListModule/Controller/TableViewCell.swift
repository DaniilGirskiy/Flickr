//
//  TableViewCell.swift
//  JSONParsingApp
//
//  Created by Danya on 15.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
