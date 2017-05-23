//
//  APILoader.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethod : String {
    case GET = "GET"
    case POST = "POST"
}

class APIProvider: NSObject {
    
    static let baseURL = "https://api.500px.com/v1/photos?feature=popular"
    static let consumerKey = "0KbHMZP2gjO8yF2xWeLB7BfQzxkROSDSWy7kQidc"
    
    static func createGETUrlString() -> String {
        let resUrl = baseURL + "&consumer_key=" + consumerKey
        return resUrl
    }
    
}
