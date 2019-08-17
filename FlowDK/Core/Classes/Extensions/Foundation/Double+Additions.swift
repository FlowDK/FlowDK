import Foundation

public extension Double {
	mutating func roundedToNumberOfPlaces(_ places: Int) -> Double {
		let divisor = pow(10.0, Double(places))
		return (self * divisor).rounded() / divisor
	}
}
