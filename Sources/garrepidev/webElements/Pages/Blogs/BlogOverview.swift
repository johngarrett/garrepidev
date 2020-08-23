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
            posts.compactMap { $0 }.map{ PostCard(from: $0) }
        }
       .maxWidth(1200)
       .rawCSS("display", "grid")
       .rawCSS("grid-gap", "3rem")
    }
}
