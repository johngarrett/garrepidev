import Foundation
import HyperSwift

public struct BlogDetail: HTMLPage {
    public var href: String
    public var title: String
    public let post: Post
    
    public func render() -> HTMLComponent {
        VStack {
            PostCard(post, for: .detailPage)
            Div("g_blog_detail_text") {
                MarkdownContent(from: post.body)
            }
            .backgroundColor(GColors.white)
            .border(1, .solid, color: CSSColor("#000000"))
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
