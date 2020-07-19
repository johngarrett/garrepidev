import Foundation
import HyperSwift

public class Card: HTMLComponent {
    public init(body: HTMLElement) {
        let card =
            Div(GClasses.card.rawValue)
            .backgroundColor(GColors.white)
            .margin(top: 10, right: 10, left: 10)
            .shadow(x: 20, y: 30, color: GColors.cardShadow)
            .rawCSS("border", "1px solid #000000")
        
        super.init(.empty, [card])
    }
}
