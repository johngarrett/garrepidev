import Foundation
import HyperSwift

public struct BlogDetail: HTMLPage {
    public let post: Post
    static public var absoluteAddress: String = "testPost.html"
    
    public func render() -> HTMLComponent {
        VStack {
            PostCard(post)
            Markdown(cls: "g_blog_detail", post.body)
                .backgroundColor(CSSColor("#FFFFFF"))
                .font(weight: "normal", size: 14, family: "CrimsonText")
                .rawCSS("border", "1px solid #000000")
        }
    }
    
    public init?(with post: Post?) {
        guard let post = post else {
            return nil
        }
        self.post = post
    }
}
