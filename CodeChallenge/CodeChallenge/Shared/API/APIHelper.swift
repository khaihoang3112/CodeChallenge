//
//  APILoader.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation
import UIKit

enum RequestMethod : String {
    case GET = "GET"
    case POST = "POST"
}

class APIHelper: NSObject {
    
    static let photoURL = "https://api.500px.com/v1/photos?feature=popular"
    static let consumerKey = "0KbHMZP2gjO8yF2xWeLB7BfQzxkROSDSWy7kQidc"
    
    static func getPhotoFromURL() -> String {
        let url = photoURL + "&consumer_key=" + consumerKey
        return url
    }
    
}
