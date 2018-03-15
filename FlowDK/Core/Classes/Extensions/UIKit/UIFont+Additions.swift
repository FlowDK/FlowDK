import UIKit

public extension UIFont {
  public class func allFontNames() -> [String: [String]] {
    var all = [String: [String]]()
    for familyName in familyNames {
      let fontNames = UIFont.fontNames(forFamilyName: familyName)
      all[familyName] = fontNames
    }
    return all
  }
  
  public class func allFontNamesString() -> String {
    let all = allFontNames()
    
    var string = ""
    
    for key in all.keys {
      string += "\(key)\n"
      
      if let names = all[key] {
        for name in names {
          string += "  - \(name)\n"
        }
      }
    }
    return string
  }
}
