//
//  Photos.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation
import ObjectMapper

class Photos: Mappable {
    var feature: String
    var currentPage: Int
    var totalPages: Int
    
    var threeDayForecast: [Forecast]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}

class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}

class Photos: Mappable {
    var id: Int
    var name: String
    var description: String
    var times_viewed: Int
    var rating: Float
    var created_at: String
    var category: Int
    var privacy: Bool
    var width: Float
    var height: Float
    var votes_count: Int
    var comment_counts: Int
    var nsfw: Bool
    var image_url: String
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        times_viewed <- map["times_viewed"]
        rating <- map["rating"]
        created_at <- map["created_at"]
        category <- map["category"]
        privacy <- map["privacy"]
        width <- map["width"]
        height <- map["height"]
        votes_count <- map["votes_count"]
        comment_counts <- map["comment_counts"]
        nsfw <- map["nsfw"]
        image_url <- map["image_url"]
    }
}


"feature": "popular",
"filters": {
    "category": false,
    "exclude": false
},
"current_page": 1,
"total_pages": 250,
"total_items": 5000,
"photos": [
{
"id": 4910421,
"name": "Orange or lemon",
"description": "",
"times_viewed": 709,
"rating": 97.4,
"created_at": "2012-02-09T02:27:16-05:00",
"category": 0,
"privacy": false,
"width": 472,
"height": 709,
"votes_count": 88,
"comments_count": 58,
"nsfw": false,
"image_url": "http://pcdn.500px.net/4910421/c4a10b46e857e33ed2df35749858a7e45690dae7/2.jpg",
"user": {
"id": 386047,
"username": "Lluisdeharo",
"firstname": "Lluis ",
"lastname": "de Haro Sanchez",
"city": "Sabadell",
"country": "Catalunya",
"fullname": "Lluis de Haro Sanchez",
"userpic_url": "http://acdn.500px.net/386047/f76ed05530afec6d1d0bd985b98a91ce0ce49049/1.jpg?0",
"upgrade_status": 0
}
},
