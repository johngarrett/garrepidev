import Foundation
import HyperSwift

public class Card: HTMLComponent {
    public init(body: HTMLElement) {
        super.init(
            Div(cssClass: GClasses.card.rawValue)
                .backgroundColor(CSSColor(from: SiteColors.elementBackground))
                .margin(top: 10, right: 10, left: 10)
                .shadow(x: 20, y: 30, color: CSSColor(from: SiteColors.cardShadow))
                .border(1, .solid, color: CSSColor("#000000"))
        )
    }
}
