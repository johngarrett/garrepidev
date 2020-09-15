import Foundation
import HyperSwift
import Ink

public enum DetailPage: String {
    case blog, project
}

public class DetailTextCard: HTMLComponent {
    init(with text: String, for page: DetailPage) {
        let cssClass = "g_\(page.rawValue)_detail_text_card"
        let parser = MarkdownParser()
        
        var card =
            Div(cssClass) {
                parser.html(from: text)
            }
            .backgroundColor(GColors.white)
            .font(weight: "normal", size: 16, family: "CrimsonText")
            .display(.inlineBlock)
            .padding(top: 1, right: 2, bottom: 1, left: 2, .percent)
            .rawCSS("border", "1px solid #000000")
            .textAlign(.left)

        if page == .project {
            card = card
                .maxWidth(700, .px)
                .shadow(x: 20, y: 30, color: GColors.cardShadow)
                .margin(3, .percent)
        } else {
            card = card
                .margin(top: 40)
                .padding(20)
        }
        
        super.init(.empty, [card])
    }
}
