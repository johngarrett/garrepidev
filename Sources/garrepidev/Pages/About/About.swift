import Foundation
import HyperSwift

public struct About: HTMLPage {
    public var href: String = "/about"
    public var title: String = "garreπ | about"
    
    public func render() -> HTMLComponent {
        Div(GClasses.aboutCard.rawValue) {
            HTMLComponent(.header1) { "About" }
                .color(GColors.black)
                .font(weight: .bold, size: 45, family: "SF Mono")
                .margin(top: 10, bottom: 10)

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
                    
                    [@garrepi](https://twitter.com/garrepi)
                    """
            )
            .font(weight: .normal, size: 16, family: "SF Mono")
            .padding(10)
        }
        .backgroundColor(GColors.white)
        .textAlign(.center)
        .shadow(x: 20, y: 30, color: GColors.cardShadow)
        .minWidth(50, .percent)
        .maxWidth(75, .percent)
        .border(1, .solid, color: CSSColor("#000000"))
        .rawCSS("place-self", "center")
        .rawCSS("align-self", "baseline")
        .padding(10)
        .margin(top: 30, bottom: 50)
        
    }
    
    public init() {}
}
