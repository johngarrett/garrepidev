import Foundation
import HyperSwift

public struct FourOFour: HTMLPage {
    public init() { }
    public var href: String = "/404"
    public var title: String = "garreπ | 404 error"
    
    public func render() -> HTMLComponent {
        VStack("g_fourOfour", justify: .center, align: .center) {
            Image(url: "/images/error_bomb.png")
                .width(200)
                .height(200)
            Header(.header3) { "HTTP 404" }
                .font(weight: .bold, size: 40, family: "SF Mono")
            Paragraph("Page Not Found")
        }
        .backgroundColor(SiteColors.fourOFourRed)
        .textAlign(.center)
        .margin(5, .percent)
        .height(500)
        .width(500)
        .display(.flex)
        .shadow(x: 20, y: 30, color: CSSColor(from: SiteColors.cardShadow))
        .padding(top: 1, right: 1, bottom: 1, left: 1, .percent)
        .border(1, .solid, color: CSSColor("#000000"))
    }
}
