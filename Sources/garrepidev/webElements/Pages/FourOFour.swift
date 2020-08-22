import Foundation
import HyperSwift

public struct FourOFour: HTMLPage {
    public init() { }
    public static var absoluteAddress: String = "/404"
    
    public func render() -> HTMLComponent {
        VStack("g_fourOfour", justify: .center, align: .center) {
            Image(url: "/images/error_bomb.png")
                .width(200)
                .height(200)
            Header(.header3) { "HTTP 404" }
                .font(weight: "bold", size: 40, family: "SF Mono")
            Paragraph("Page Not Found")
        }
        .backgroundColor(GColors.lightRed)
        .textAlign(.center)
        .margin(5, .percent)
        .height(500)
        .width(500)
        .display(.flex)
        .shadow(x: 20, y: 30, color: GColors.cardShadow)
        .padding(top: 1, right: 1, bottom: 1, left: 1, .percent)
        .rawCSS("border", "1px solid #000000")
    }
}
