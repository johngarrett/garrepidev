import Foundation
import HyperSwift

public struct BlogDetail: HTMLPage {
    public var href: String
    public var title: String
    public let post: Post
    
    public func render() -> HTMLComponent {
        VStack {
            Div {
                PostCard(post)
            }.margin(3, .percent)
            DetailTextCard(with: post.body, for: .blog)
        }
    }
    
    public init?(with post: Post?) {
        guard let post = post else {
            return nil
        }
        self.post = post
        self.href = post.href
        self.title = post.title
    }
}
