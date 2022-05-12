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
                HStack("g_post_top", justify: .spaceBetween, align: .center, wrap: .wrap) {
                    HTMLComponent(.h1) { post.title }
                        .font(weight: .bold, size: 25, family: "SF Mono")
                        .width(70, .percent)
                        .color(SiteColors.primaryText)
                    Paragraph("\(post.date)<br />\(post.getWordCount()) words")
                        .font(weight: .normal, size: 13, family: "SF Mono")
                        .width(20, .percent)
                        .color(SiteColors.secondaryText)
                        .textAlign(.right)
                }
                .padding(top: 10, right: 15, bottom: 0, left: 15)
                
                HStack("g_post_bottom", justify: .spaceBetween, align: .center, wrap: .wrap) {
                    Div {
                        Markdown(cssClass: "g_post_abstract", post.abstract)
                            .textAlign(.left)
                            .font(weight: .normal, size: 13, family: "SF Mono")
                            .color(SiteColors.secondaryText)
                        HStack(justify: .center, wrap: .wrap) { post.tags }
                    }
                    Image(url: post.imageURL ?? "")
                        .padding(right: 5, left: 5, .percent)
                        .maxWidth(150)
                        .maxHeight(120)
                        .objectFit(.cover)
                        .overflow(.hidden)
                }
                .padding(right: 3, bottom: 1, left: 3, .percent)
            }
            .wordWrap(.breakWord)
            .minHeight(200)
            .backgroundColor(SiteColors.elementBackground)
            .shadow(x: 20, y: 30, color: CSSColor(from: SiteColors.cardShadow))
            .border(1, .solid, color: CSSColor("#000000"))
            .add(style: CSSStyle("cursor", "pointer"))
        if page == .detailPage {
            card = card
                .add(style: CSSStyle("place-self", "center"))
                .width(80, .percent)
                .maxWidth(800)
                .margin(top: 30, bottom: 50)
        }
        
        super.init(card)
    }
}
