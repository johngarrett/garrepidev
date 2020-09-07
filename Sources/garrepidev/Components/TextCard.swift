import Foundation
import HyperSwift

public class TextCard: HTMLComponent {
    init(with text: String) {
        let card =
            Div(GClasses.textCard.rawValue) {
                RawHTML(text)
            }
            .backgroundColor(GColors.white)
            .margin(3, .percent)
            .display(.inlineBlock)
            .padding(top: 1, right: 2, bottom: 1, left: 2, .percent)
            .shadow(x: 20, y: 30, color: GColors.cardShadow)
            .rawCSS("border", "1px solid #000000")
            .textAlign(.left)
            .maxWidth(700, .px)
        
        super.init(.empty, [card])
    }
}
