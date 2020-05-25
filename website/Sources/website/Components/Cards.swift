//import Foundation
//
//
//class Cards: HTMLComponent {
//    init(_ cards: HTMLComponent...) {
//        super.init(.div, cards)
//    }
//}
//
//extension Cards {
//    convenience init(@CardsBuilder _ cards: [HTMLComponent]) {
//        self.init(
//            tag ?? HTMLTag.empty,
//            attributes: attributes,
//            [component()]
//        )
//    }
//}
//
//@_functionBuilder
//struct CardsBuilder {
//    static func buildBlock(_ cards: ProjectCard...) -> HTMLComponent {
//        HTMLComponent(.div) {
//            cards
//        }
//        .maxWidth(1200)
//        .margin(right: 5, left: 5)
//        .display(.grid)
//        .rawCSS("grid-gap", "1rem")
//    }
//}
