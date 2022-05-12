import Foundation
import HyperSwift

public struct BlogOverview: HTMLPage {
    public var href: String = "/blog"
    public var title: String = "garreπ | blog"
    
    public var posts: [Post]!
    public var blogDetailPages: [BlogDetail]!
    
    
    public init(_ posts: [Post]? = nil) {
        self.posts = (posts ?? []).sorted(by: {
            Int($0.date.replacingOccurrences(of: "/", with: "")) ?? -1
                > Int($1.date.replacingOccurrences(of: "/", with: "")) ?? -1
        })
        self.blogDetailPages = self.posts.compactMap {
            BlogDetail(with: $0)
        }
    }

    public func render() -> HTMLComponent {
        Div(GClasses.blogCardsGrid.rawValue) {
            posts.compactMap { $0 }.map{ PostCard($0, for: .overviewPage) }
        }
        .display(.grid)
        .justifyContent(.center)
        .margin(top: 20, right: 40, bottom: 40, left: 20)
        .add(
            styles:
                Style("grid-row-gap", "2em"),
                Style("align-content", "baseline"),
                Style("grid-template-columns", "1fr")
        )
    }
}
