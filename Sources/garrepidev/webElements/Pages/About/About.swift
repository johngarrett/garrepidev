import Foundation
import HyperSwift

public struct About: HTMLPage {
    static public var absoluteAddress = "/about"
    public func render() -> HTMLComponent {
        Div(GClasses.aboutCard.rawValue) {
            HTMLComponent(.header1) { "About" }
                .color(GColors.black)
                .font(weight: "bold", size: 45, family: "SF Mono")

            Paragraph(
                    """
                    Welcome to my website. Here is where I host all my projects and blogs.
                    See below for more information.

                    This website was written 100% in swift
                    """
            ).padding(right: 10, left: 10, .percent)
        }
        .backgroundColor(GColors.white)
        .textAlign(.center)
        .margin(5, .percent)
        .width(70, .percent)
        .shadow(x: 20, y: 30, color: GColors.cardShadow)
        .rawCSS("border", "1px solid #000000")
    }
    
    public init() {}
}
