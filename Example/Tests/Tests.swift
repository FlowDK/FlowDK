// https://github.com/Quick/Quick

import Quick
import Nimble
import FlowDK

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("Foundation Extensions") {
            context("String") {
                it("url works") {
                    let urlString = "http://www.google.com"
                    expect(urlString.url?.absoluteString) == urlString
                }
            }
        }
        
        describe("Misc Examples") {
            context("these will pass") {
                it("can do maths") {
                    expect(23) == 23
                }

                it("can read") {
                    expect("🐮") == "🐮"
                }

                it("will eventually pass") {
                    var time = "passing"

                    DispatchQueue.main.async {
                        time = "done"
                    }

                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
    }
}
