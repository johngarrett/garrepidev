import Foundation
import HyperSwift

public class Card: HTMLComponent {
    public init(body: HTMLElement) {
        let card =
            Div(GClasses.card.rawValue)
            .backgroundColor(GColors.white)
            .margin(top: 10, right: 10, left: 10)
            .shadow(x: 20, y: 30, color: GColors.cardShadow)
            .border(1, .solid, color: CSSColor("#000000"))
        
        super.init(.empty, [card])
    }
}
