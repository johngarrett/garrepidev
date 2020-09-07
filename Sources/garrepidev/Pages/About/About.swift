import Foundation
import HyperSwift

public struct About: HTMLPage {
    static public var absoluteAddress = "/about"
    public func render() -> HTMLComponent {
        Div(GClasses.aboutCard.rawValue) {
            HTMLComponent(.header1) { "About" }
                .color(GColors.black)
                .font(weight: "bold", size: 45, family: "SF Mono")

            Markdown(cls: "about_text",
                    """
                    Welcome to my website -- this is where I host all my projects and blogs.

                    This website was written 100% in swift.

                    Check out the source code:  

                    [garrepidev](https://github.com/johngarrett/garrepidev)  
                    > the source code for all the pages here

                    [HyperSwift](https://github.com/johngarrett/HyperSwift)  
                    > the DSL that powers this website

                    [johngarrett.github.io](https://github.com/johngarrett/johngarrett.github.io)  
                    > the static github pages you're looking at now
                    """
            )
                .font(weight: "normal", size: 14, family: "CrimsonText")
                .padding(right: 5, left: 5, .percent)
        }
        .backgroundColor(GColors.white)
        .textAlign(.center)
        .shadow(x: 20, y: 30, color: GColors.cardShadow)
        .minWidth(80, .percent)
        .rawCSS("border", "1px solid #000000")
    }
    
    public init() {}
}
