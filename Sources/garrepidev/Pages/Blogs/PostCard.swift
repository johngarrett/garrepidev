import Foundation
import HyperSwift

public class PostCard: HTMLComponent {
    init(_ post: Post) {
        let wordCount = post.body.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }.count
        let card =
            Div(GClasses.blogCard.rawValue, attributes: ["onclick": "location.href='\(post.href)';"]) {
                HStack("g_post_top", justify: .spaceBetween, align: .center) {
                    HTMLComponent(.header1) { post.title }
                        .font(weight: "bold", size: 25, family: "SF Mono")
                        .width(70, .percent)
                    Paragraph("\(post.date)<br />\(wordCount) words")
                        .font(weight: "regular", size: 13, family: "SF Mono")
                        .width(20, .percent)
                        .color(GColors.lightGray)
                        .textAlign(.right)
                }
                .padding(top: 1, right: 2.5, bottom: 0, left: 2.5, .percent)
                
                HStack("g_post_bottom", justify: .spaceBetween, align: .center) {
                    Div {
                        Markdown(cls: "g_post_abstract", post.abstract)
                            .textAlign(.left)
                            .font(weight: "regular", size: 13, family: "SF Mono")
                            .color(GColors.lightGray)
                        HStack(justify: .center) { post.tags }
                    }
                    .width(80, .percent)
                    Image(url: post.imageURL ?? "")
                        .margin(right: 5, left: 5, .percent)
                        .width(20, .percent)
                        .objectFit(.cover)
                }
                .padding(right: 3, bottom: 1, left: 3, .percent)
            }
                .wordWrap(.brk)
                .minHeight(200)
                .backgroundColor(GColors.white)
                .shadow(x: 20, y: 30, color: GColors.cardShadow)
                .rawCSS("border", "1px solid #000000")
        
        super.init(.empty, [card])
    }
}
