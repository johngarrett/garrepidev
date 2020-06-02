import Foundation

struct PostDetailView: HTMLPage {
    var sidebar: ComponentType = Sidebar()
    let post: Post
    static var relativeAddress: String = "blog/post1"
    
    func render() -> HTMLComponent {
        Paragraph("Testing")
    }
    
    init(with post: Post) {
        self.post = post
    }
}
