import UIKit

// TODO: Make a better way to have configuration in FlowDK
public struct Constants {
  public struct Colors {
    static let orange = UIColor(0xF3AA00)
    static let purple = UIColor(0xB37EFB)
    static let darkOrange = UIColor(0xD86427)
    static let darkGray = UIColor(0x3F5364)
    static let gray = UIColor(0xc8c8c8)
    static let lightGray = UIColor(0xDFDFDF)
    static let yellow = UIColor(0xFFBB1E)
    static let green = UIColor(0x84C737)
    
    static let brightGreen = UIColor(0x2AD070)
    static let darkGreen = UIColor(0x21A559)
    
    static let black = UIColor(0x34485A)
    
    static let lightBlue = UIColor(0x81cce9)
    static let blue = UIColor(0x199ed9)
    
    static let lightCerulian = UIColor(0x009ddc)
    static let cerulean = UIColor(0x0386ba)
    static let darkCerulian = UIColor(0x026b94)
  }
  
  public struct Font {
    struct Primary {
      static let bold = "CharlesModern-Bold"
      static let regular = "CharlesModernRegular"
      static let medium = "CharlesModernMedium"
    }
  }
}
