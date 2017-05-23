//
//  NameTableViewCell.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(photo: Photos) {
        if let name = photo.name, let info = photo.des {
            nameLabel.text = name
            descriptionLabel.text = info
        }

    }
    
}
