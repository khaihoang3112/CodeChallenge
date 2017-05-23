//
//  ImageDetailTableViewCell.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import UIKit

class ImageDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(photo: Photos) {
        DispatchQueue.global().async {
            let data = NSData(contentsOf: URL(string: photo.image_url!)!)
            let image = UIImage(data: data! as Data)
            DispatchQueue.main.async {
                self.fullImageView.contentMode = .scaleToFill
                self.fullImageView.image = image
            }
        }

    }
    
}
