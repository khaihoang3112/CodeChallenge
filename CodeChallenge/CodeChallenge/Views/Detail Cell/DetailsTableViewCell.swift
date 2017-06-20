//
//  DetailsTableViewCell.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/25/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var totalCommentsLabel: UILabel!
    
    @IBOutlet weak var totalFavoritesLabel: UILabel!
    
    @IBOutlet weak var totalViewsLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(photo: Photos) {
        
        thumbImageView.layer.cornerRadius = 35
        thumbImageView.layer.masksToBounds = true
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.init(hexString: "#5D9939").cgColor
        followButton.layer.cornerRadius = 5
        
        // Set text label
        nameLabel.text = photo.name
        subLabel.text = photo.camera
        totalCommentsLabel.text = "\(photo.comments_count!)"
        totalFavoritesLabel.text = "\(photo.votes_count!)"
        totalViewsLabel.text = "\(photo.times_viewed!)"

        // Get image from URL
        DispatchQueue.global().async {
            let dataDetail = NSData(contentsOf: URL(string: (photo.image_url?[0])!)!)
            let detailImage = UIImage(data: dataDetail! as Data)
            
            let dataThumb = NSData(contentsOf: URL(string: (photo.user?.userpic_url)!)!)
            let thumbImage = UIImage(data: dataThumb! as Data)
            DispatchQueue.main.async {
                self.detailImageView.contentMode = .scaleAspectFit
                self.detailImageView.image = detailImage
                self.detailImageView.roundCornersForAspectFit(radius: 10)
                
                let rect = self.detailImageView.frameForImageInImageViewAspectFit()
                let tempView = UIView()
                tempView.frame = rect
                tempView.backgroundColor = .clear
                self.detailImageView.addSubview(tempView)
                
                let groupImageView = UIImageView()
                groupImageView.frame = CGRect(x: rect.size.width - 42, y: 10, width: 32, height: 32)

                groupImageView.image = UIImage(named: "icon-group")
                tempView.addSubview(groupImageView)
                
                self.thumbImageView.contentMode = .scaleToFill
                self.thumbImageView.image = thumbImage
            }
        }

    }
    
}
