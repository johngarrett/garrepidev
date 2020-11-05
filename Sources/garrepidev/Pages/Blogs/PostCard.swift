import Foundation
import HyperSwift

public class PostCard: HTMLComponent {
    enum Page: String {
        case overviewPage, detailPage
    }
    
    init(_ post: Post, for page: Page = .overviewPage) {
        let attributes = page == .overviewPage ?  ["onclick": "location.href='\(post.href)';"] : ["":""]
        let cssClass = "g_post_card_\(page.rawValue)"
        var card =
            Div(cssClass, attributes: attributes) {
                HStack("g_post_top", justify: .spaceBetween, align: .center) {
                    HTMLComponent(.header1) { post.title }
                        .font(weight: .bold, size: 25, family: "SF Mono")
                        .width(70, .percent)
                    Paragraph("\(post.date)<br />\(post.getWordCount()) words")
                        .font(weight: .normal, size: 13, family: "SF Mono")
                        .width(20, .percent)
                        .color(GColors.lightGray)
                        .textAlign(.right)
                }
                .padding(top: 1, right: 2.5, bottom: 0, left: 2.5, .percent)
                
                HStack("g_post_bottom", justify: .spaceBetween, align: .center) {
                    Div {
                        Markdown(cssClass: "g_post_abstract", post.abstract)
                            .textAlign(.left)
                            .font(weight: .normal, size: 13, family: "SF Mono")
                            .color(GColors.lightGray)
                        HStack(justify: .center) { post.tags }
                    }
                    .width(80, .percent)
                    Image(url: post.imageURL ?? "")
                        .margin(right: 5, left: 5, .percent)
                        .maxWidth(150)
                        .maxHeight(120)
                        .objectFit(.cover)
                        .overflow(.hidden)
                }
                .padding(right: 3, bottom: 1, left: 3, .percent)
            }
            .wordWrap(.brk)
            .minHeight(200)
            .backgroundColor(GColors.white)
            .shadow(x: 20, y: 30, color: GColors.cardShadow)
            .border(1, .solid, color: CSSColor("#000000"))
            .rawCSS("cursor", "pointer")
        if page == .detailPage {
            card = card
                .rawCSS("place-self", "center")
                .width(80, .percent)
                .maxWidth(800)
                .margin(top: 30, bottom: 50)
        }
        
        super.init(.empty, [card])
    }
}
