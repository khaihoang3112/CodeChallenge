

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
}
