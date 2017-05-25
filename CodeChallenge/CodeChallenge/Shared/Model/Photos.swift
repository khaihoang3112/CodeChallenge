//
//  Photos.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation
import UIKit

struct UserTakePhoto {
    let user_id: Int?
    let fullname: String?
    let userpic_url: String?
    
    init(id: Int?, name: String?, url: String?) {
        user_id = id
        fullname = name
        userpic_url = url
    }
}

class Photos: NSObject {
    var id_photo: Int?
    var name: String?
    var camera: String?
    var des: String?
    var rating: Float?
    var created_at: String?
    var width: Float?
    var height: Float?
    var image_url: [String]?
    var times_viewed: Int?
    var comments_count: Int?
    var votes_count: Int?
    var user: UserTakePhoto?
    
    init(dict: [String: AnyObject]) {
        
        guard let id_photo = dict["id"],
            let name = dict["name"],
            let camera = dict["camera"],
            let des = dict["description"],
            let rating = dict["rating"],
            let created_at = dict["created_at"],
            let width = dict["created_at"],
            let height = dict["created_at"],
            let image_url = dict["image_url"],
            let times_viewed = dict["times_viewed"],
            let comments_count = dict["comments_count"],
            let votes_count = dict["votes_count"],
            let user = dict["user"]
            else { return }
        
        self.id_photo = id_photo as? Int
        self.name = name as? String
        self.camera = camera as? String
        self.des = des as? String
        self.rating = rating as? Float
        self.created_at = created_at as? String
        self.width = width as? Float
        self.height = height as? Float
        self.image_url = image_url as? [String]
        self.times_viewed = times_viewed as? Int
        self.comments_count = comments_count as? Int
        self.votes_count = votes_count as? Int
        self.user = UserTakePhoto(id: user["id"] as? Int, name: user["fullname"] as? String, url: user["userpic_url"] as? String)
    }
    
}
