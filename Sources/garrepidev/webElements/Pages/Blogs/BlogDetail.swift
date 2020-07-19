import Foundation
import HyperSwift

public struct BlogDetail: HTMLPage {
    let post: Post
    static public var absoluteAddress: String = "testPost.html"
    
    public func render() -> HTMLComponent {
        VStack {
            PostCard(from: post)
            TextCard(with: post.body)
        }
    }
    
    public init?(with post: Post?) {
        guard let post = post else {
            return nil
        }
        self.post = post
    }
}
