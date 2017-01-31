import FlowDK

import Quick
import Nimble

class ExtensionsSpec: QuickSpec {
    override func spec() {
        describe("Foundation Extensions") {
            context("String") {
                it("url") {
                    let urlString = "http://www.google.com"
                    expect(urlString.url?.absoluteString) == urlString
                }
            }
        }
        
        describe("UIKit Extensions") {
            context("UIWindow") {
                it("initWithRootViewController:makeKeyAndVisible:") {
                    let viewController = UIViewController()
                    let window = UIWindow(rootViewController: viewController, makeKeyAndVisible: true)
                    expect(window.rootViewController) == viewController
                    expect(window.isKeyWindow) == true
                }
            }
            context("UIView") {
                it("addSubviews") {
                    let view = UIView()
                    let subview1 = UIView()
                    let subview2 = UIView()
                    view.addSubviews([subview1, subview2])
                    
                    expect(view.subviews.contains(subview1)) == true
                    expect(view.subviews.contains(subview2)) == true
                }
            }
            context("UIColor") {
                it("initWithHex:alpha") {
                    let color = UIColor(0xff0000, alpha: 0.714)
                    var red: CGFloat = 0
                    var green: CGFloat = 0
                    var blue: CGFloat = 0
                    var alpha: CGFloat = 0

                    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                    expect(red) == 255/255
                    expect(green) == 0
                    expect(blue) == 0
                    expect(alpha) == 0.714
                }
            }
        }
    }
}
