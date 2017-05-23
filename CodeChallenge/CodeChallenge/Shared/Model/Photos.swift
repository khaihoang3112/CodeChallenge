//
//  Photos.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation
import UIKit

class Photos: NSObject {
    
    var name: String?
    var des: String?
    var rating: Float?
    var created_at: String?
    var width: Float?
    var height: Float?
    var image_url: String?
    
    init(dict: [String: AnyObject]) {
        
        guard let name = dict["name"],
            let des = dict["description"],
            let rating = dict["rating"],
            let created_at = dict["created_at"],
            let width = dict["created_at"],
            let height = dict["created_at"],
            let image_url = dict["image_url"]
            else { return }
        
        self.name = name as? String
        self.des = des as? String
        self.rating = rating as? Float
        self.created_at = created_at as? String
        self.width = width as? Float
        self.height = height as? Float
        self.image_url = image_url as? String
    }
    
}
