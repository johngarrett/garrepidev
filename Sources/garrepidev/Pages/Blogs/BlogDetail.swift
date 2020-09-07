import Foundation
import HyperSwift

public struct BlogDetail: HTMLPage {
    public let post: Post
    static public var absoluteAddress: String = "testPost.html"
    
    public func render() -> HTMLComponent {
        VStack {
            Div {
                PostCard(post)
            }.margin(3, .percent)
            Markdown(cls: "g_blog_detail", post.body)
                .backgroundColor(CSSColor("#FFFFFF"))
                .font(weight: "normal", size: 16, family: "CrimsonText")
                .rawCSS("border-top", "1px solid #000000")
                .rawCSS("border-bottom", "1px solid #000000")
                .margin(top: 40)
                .padding(20)
        }
    }
    
    public init?(with post: Post?) {
        guard let post = post else {
            return nil
        }
        self.post = post
    }
}
