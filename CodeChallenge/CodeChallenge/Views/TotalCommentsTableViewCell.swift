//
//  TotalCommentsTableViewCell.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/24/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import UIKit

class TotalCommentsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var namePhotoLabel: UILabel!
    @IBOutlet weak var totalCommentsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(photo: Photos) {
        self.imgView.layer.cornerRadius = 40
        self.imgView.layer.masksToBounds = true
        self.contentView.backgroundColor = UIColor.lightGray
        if photo.name != nil {
            namePhotoLabel.text = photo.name
        }
        
        totalCommentsLabel.text = "\(photo.comments_count) comments"
        
        if photo.image_url?[0] != nil {
            DispatchQueue.global().async {
                let data = NSData(contentsOf: URL(string: (photo.image_url![0]))!)
                let image = UIImage(data: data! as Data)
                DispatchQueue.main.async {
                    self.imgView.contentMode = .scaleToFill
                    self.imgView.image = image
                }
            }
        }

    }
    
}
