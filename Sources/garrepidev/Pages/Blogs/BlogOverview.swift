import Foundation
import HyperSwift

public struct BlogOverview: HTMLPage {
    private var posts: [Post?]
    static public var absoluteAddress = "/blog"
    
    public init(_ posts: [Post]? = nil) {
        self.posts = posts ?? []
    }
    
    public func render() -> HTMLComponent {
        Div(GClasses.blogCardsGrid.rawValue) {
            posts.compactMap { $0 }.map{ PostCard($0) }
        }
        .rawCSS("display", "grid")
        .rawCSS("grid-gap", "3rem")
        .margin(top: 20, right: 40, bottom: 40, left: 20)
    }
}
