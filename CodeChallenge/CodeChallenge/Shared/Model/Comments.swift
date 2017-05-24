//
//  Comments.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/24/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let user_id: Int?
    let fullname: String?
    let userpic_url: String?
    
    init(id: Int?, name: String?, url: String?) {
        user_id = id
        fullname = name
        userpic_url = url
    }
}

class Comments: NSObject {
    var user_id: Int?
    var body: String?
    var created_at: String?
    var user: User?

    init(dict: [String: AnyObject]) {
        
        guard let userId = dict["user_id"],
            let body = dict["body"],
            let created_at = dict["created_at"],
            let user = dict["user"]
            else { return }
        
        self.user_id = userId as? Int
        self.body = body as? String
        self.created_at = created_at as? String
        self.user = User(id: user["id"] as? Int, name: user["fullname"] as? String, url: user["userpic_url"] as? String)
    }
    
   
    
}
