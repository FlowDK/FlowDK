import UIKit

public extension UIView {
    public func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
}
