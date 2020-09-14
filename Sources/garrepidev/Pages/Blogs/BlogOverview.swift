import Foundation
import HyperSwift

public struct BlogOverview: HTMLPage {
    public var posts: [Post]!
    public var blogDetailPages: [BlogDetail]!

    static public var absoluteAddress = "/blog"
    
    public init(_ posts: [Post]? = nil) {
        self.posts = posts ?? []
        self.blogDetailPages = self.posts.compactMap { BlogDetail(with: $0) }
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
