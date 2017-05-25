//
//  CommentTableViewCell.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(comment: Comments) {
        avatarImageView.layer.cornerRadius = 30
        avatarImageView.layer.masksToBounds = true
        
        if (comment.body != nil) {
            contentLabel.text = comment.body
        }
        if comment.created_at != nil {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let before = dateFormatter.date(from: comment.created_at!)!
            
            timeLabel.text = before.elapsedTime(stringDate: comment.created_at!)
        }
        
        if comment.user?.fullname != nil {
            usernameLabel.text = comment.user?.fullname
        }
        
        if comment.user?.city != nil {
            cityLabel.text = comment.user?.city
        }
        
        if (comment.user?.userpic_url!) != nil {
            DispatchQueue.global().async {
                let data = NSData(contentsOf: URL(string: (comment.user?.userpic_url!)!)!)
                let image = UIImage(data: data! as Data)
                DispatchQueue.main.async {
                    self.avatarImageView.contentMode = .scaleToFill
                    self.avatarImageView.image = image
                }
            }
        }
    }

}
