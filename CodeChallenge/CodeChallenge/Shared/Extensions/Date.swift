//
//  Date.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/24/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation

extension Date {
    var timestampString: String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 1
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
        
        guard let timeString = formatter.string(from: self, to: Date()) else {
            return nil
        }
        
        let formatString = NSLocalizedString("%@ ago", comment: "")
        return String(format: formatString, timeString)
    }
    
    func elapsedTime(stringDate: String) -> String
    {
        //just to create a date that is before the current time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let before = dateFormatter.date(from: stringDate)!
        
        //getting the current time
        let now = Date()
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1 //increase it if you want more precision
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute]
        
        let formatString = NSLocalizedString("%@ ago", comment: "Used to say how much time has passed. e.g. '2 hours ago'")
        let timeString = formatter.string(from: before, to: now)
        return String(format: formatString, timeString!)
    }

}
