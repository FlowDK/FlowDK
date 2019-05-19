import UIKit

class Utilities {
  static let impactFeedbackGenerator: (
    light: UIImpactFeedbackGenerator,
    medium: UIImpactFeedbackGenerator,
    heavy: UIImpactFeedbackGenerator) = (
      UIImpactFeedbackGenerator(style: .light),
      UIImpactFeedbackGenerator(style: .medium),
      UIImpactFeedbackGenerator(style: .heavy)
  )
  
  static func prepareHapticFeedback() {
    impactFeedbackGenerator.light.prepare()
    impactFeedbackGenerator.medium.prepare()
    impactFeedbackGenerator.heavy.prepare()
  }
  
  static func vibrate() {
    impactFeedbackGenerator.light.impactOccurred()
  }
}
