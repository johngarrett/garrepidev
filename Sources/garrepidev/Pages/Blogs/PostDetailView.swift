import Foundation

public struct PostDetailView: HTMLPage {
    public var sidebar: ComponentType = Sidebar()
    let post: Post
    static public var absoluteAddress: String = "testPost.html"
    
    public func render() -> HTMLComponent {
        HTMLComponent(.div, className: "g_post_titlebar") {
            HStack {
                Header { "test" }
            }
            
        }
    }
    
    public init(with post: Post) {
        self.post = post
    }
}
