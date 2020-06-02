import Foundation

struct PostDetailView: HTMLPage {
    var sidebar: ComponentType = Sidebar()
    let post: Post
    static var relativeAddress: String = "testPost.html"
    
    func render() -> HTMLComponent {
        HTMLComponent(.div, className: "g_post_titlebar") {
            HStack {
                Header { "test" }
            }
            
        }
    }
    
    init(with post: Post) {
        self.post = post
    }
}
