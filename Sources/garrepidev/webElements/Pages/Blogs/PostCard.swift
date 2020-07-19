import Foundation
import HyperSwift

public class PostCard: HTMLComponent {
    init(_ title: String, abstract: String, imgURL: String, _ tags: [Tag], href: String) {
        let card =
            Div(GClasses.blogCard.rawValue, attributes: ["onclick": "location.href='\(href)';"]) {
                HStack("g_post_top", justify: .spaceBetween, align: .center) {
                    HTMLComponent(.header1) { title }
                        .font(weight: "bold", size: 25, family: "SF Mono")
                        .width(70, .percent)
                    Paragraph("20th March, 2020<br />5,821 words")
                        .font(weight: "regular", size: 13, family: "SF Mono")
                        .width(20, .percent)
                        .color(GColors.lightGray)
                        .textAlign(.right)
                }
                .padding(top: 1, right: 2.5, bottom: 0, left: 2.5, .percent)
                
                HStack("g_post_bottom", justify: .spaceBetween, align: .center) {
                    Div {
                        Markdown(abstract)
                        HStack(justify: .center) { tags }
                    }
                    .width(80, .percent)
                    Image(url: imgURL)
                        .margin(right: 5, left: 5, .percent)
                        .width(20, .percent)
                        .objectFit(.cover)
                }
                .padding(right: 3, bottom: 1, left: 3, .percent)
            }
                .wordWrap(.brk)
                .minHeight(200)
                .backgroundColor(GColors.white)
                .margin(top: 10, right: 10, left: 10)
                .shadow(x: 20, y: 30, color: GColors.cardShadow)
                .rawCSS("border", "1px solid #000000")
        
        super.init(.empty, [card])
    }
}
extension PostCard {
    convenience init(from post: Post) {
        self.init(post.title, abstract: post.abstract, imgURL: post.imageURL ?? "", post.tags, href: post.href)
    }
}
