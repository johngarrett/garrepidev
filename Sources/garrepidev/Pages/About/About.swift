import Foundation
import HyperSwift

public struct About: HTMLPage {
    public var href: String = "/about"
    public var title: String = "garreπ | about"
    
    private func generateExperienceCard(
        title: String, summary: String, image: String, tags: [Tag], onClick href: String
    ) -> HTMLComponent {
        Div("experience-card", attributes: ["onclick": "location.href='\(href)';"]) {
            HTMLComponent(.header1) { title }
                .font(weight: .bold, size: 26, family: "SF Mono")
                .textAlign(.center)
            HStack(justify: .center) { tags }.textAlign(.center)
            Markdown(cssClass: "experience-summary", summary)
                .textAlign(.center)
                .font(weight: .normal, size: 13, family: "SF Mono")
                .color(GColors.lightGray)
                .margin(right: 10, left: 10, .percent)
            Image(url: image)
                .margin(right: 5, left: 5, .percent)
                .width(90, .percent)
                .maxHeight(250)
                .objectFit(.cover)
        }
        .wordWrap(.brk)
        .maxWidth(550)
        .minHeight(300)
        .margin(top: 10, right: 10, bottom: 10, left: 10)
        .cardStyling()
    }
    
    public func render() -> HTMLComponent {
        HTMLComponent(.empty) {
            Div(GClasses.aboutCard.rawValue) {
                HTMLComponent(.header1) { "About" }
                    .color(GColors.black)
                    .font(weight: .bold, size: 45, family: "SF Mono")
                    .margin(top: 10, bottom: 10)

                Markdown(cssClass: "about_text markdown-body",
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
            .cardStyling()
            .minWidth(50, .percent)
            .maxWidth(75, .percent)
            .margin(top: 30, bottom: 50)
            .rawCSS("place-self", "center")
            .rawCSS("align-self", "baseline")
            
            /*
            Paragraph("Experience")
                 .minWidth(50, .percent)
                .maxWidth(75, .percent)
                .cardStyling()
                .rawCSS("place-self", "center")
            Div {
                generateExperienceCard(
                    title: "SameTunes",
                    summary: "Compare, compete, and connect with your friends!",
                    image: "https://sametunes.com/images/header_logo.svg",
                    tags: [Tag("website"), Tag("music"), Tag("php"), Tag("sql")],
                    onClick: "https://www.sametunes.com"
                )
                generateExperienceCard(
                    title: "Kabbage",
                    summary: "iOS development on their Payments app",
                    image: "https://newsroom.kabbage.com/wp-content/uploads/2019/08/kabbage_logo_horizontal_reverse.jpg",
                    tags: [Tag("iOS"), Tag("fintech"), Tag("swift")],
                    onClick: "https://www.kabbage.com"
                )
            }
            .display(.grid)
            .gridGap(2, .rem)
            .padding(20)
            .margin(bottom: 20)
            .rawCSS("grid-template-columns", "repeat(auto-fit, minmax(300px, 1fr));")
            .rawCSS("justify-items", "center")
            .rawCSS("place-self", "center")
             */
        }
    }
    
    public init() {}
}

private extension HTMLComponent {
    func cardStyling() -> HTMLComponent {
        self
            .backgroundColor(GColors.white)
            .textAlign(.center)
            .shadow(x: 20, y: 30, color: GColors.cardShadow)
            .border(1, .solid, color: CSSColor("#000000"))
            .padding(10)
    }
}
