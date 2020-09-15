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
            Markdown(cls: "g_blog_detail", post.body)
                .backgroundColor(CSSColor("#FFFFFF"))
                .font(weight: "normal", size: 20, family: "CrimsonText")
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
        self.href = post.href
        self.title = post.title
    }
}
