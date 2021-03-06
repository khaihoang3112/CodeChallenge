

import Foundation

extension String {
  static func className(aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).components(separatedBy: ".").last!
  }
  
  func substring(from: Int) -> String {
    let index = self.index(self.startIndex, offsetBy: from)
    return self.substring(from: index)
  }
  
  var length: Int {
    return self.characters.count
  }
  
  static func random(length: Int = 20) -> String {
    
    let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    var randomString: String = ""
    
    for _ in 0..<length {
      let randomValue = arc4random_uniform(UInt32(base.characters.count))
      let index = base.index(base.startIndex, offsetBy: Int(randomValue))
      randomString += "\(base[index])"
    }
    
    return randomString
  }
  
  var localized: String {
    return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
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
