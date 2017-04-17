import FlowDK

import Quick
import Nimble

class ExtensionsSpec: QuickSpec {
  override func spec() {
    describe("Extensions") {
      context("Comparable Extensions") {
        it("clamp") {
          expect(2.clamp(min: 3, max: 10)).to(equal(3))
          expect(5.clamp(min: 3, max: 10)).to(equal(5))
          expect(22.clamp(min: 3, max: 10)).to(equal(10))
          expect(-2.clamp(min: 3, max: 10)).to(equal(-3))
          expect((-2).clamp(min: 3, max: 10)).to(equal(3))
        }
      }
      describe("Foundation Extensions") {
        context("String") {
          it("url") {
            let urlString = "http://www.google.com"
            expect(urlString.url?.absoluteString).to(equal(urlString))
          }
        }
      }
      
      describe("UIKit Extensions") {
        context("UIWindow") {
          it("initWithRootViewController:makeKeyAndVisible:") {
            let viewController = UIViewController()
            let window = UIWindow.window(rootViewController: viewController, makeKeyAndVisible: true)
            expect(window.rootViewController).to(equal(viewController))
            expect(window.isKeyWindow).to(equal(true))
          }
        }
        context("UIView") {
          it("addSubviews") {
            let view = UIView()
            let subview1 = UIView()
            let subview2 = UIView()
            view.addSubviews([subview1, subview2])
            
            expect(view.subviews.contains(subview1)).to(equal(true))
            expect(view.subviews.contains(subview2)).to(equal(true))
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
            expect(red).to(equal(255/255))
            expect(green).to(equal(0))
            expect(blue).to(equal(0))
            expect(alpha).to(equal(0.714))
          }
        }
      }
    }
    
    describe("Utlities") {
      var value = false
      context("Trigger") {
        it("works") {
          let trigger = Trigger(condition: { trigger in
            return (trigger.pullCount > 1)
          }, action: { trigger in
            value = true
          })
          
          trigger.pull()
          expect(value).to(equal(false))
          expect(trigger.pullCount).to(equal(1))
          
          trigger.pull()
          expect(value).to(equal(true))
          expect(trigger.pullCount).to(equal(2))
        }
      }
    }
  }
}
