import Foundation
import HyperSwift

public struct About: HTMLPage {
    public var href: String = "/about"
    public var title: String = "garreπ | about"
    
    private func generateAboutCard(_ cssClass: String, title: String, body: (() -> (HTMLComponent))) -> HTMLComponent {
        Div(cssClass) {
            HTMLComponent(.header1) { title }
                .color(GColors.black)
                .font(weight: .bold, size: 45, family: "SF Mono")
                .margin(top: 10, bottom: 10)
            body()
        }
        .cardStyling()
    }
    
    public func render() -> HTMLComponent {
        Div("g-about-grid") {
            generateAboutCard(GClasses.aboutCard.rawValue, title: "About this site") {
                HTMLComponent(.empty) {
                    Paragraph("Here's where I host all my projects and blogs. I wrote this entirely in Swift and use Github's static pages to host")
                        .textAlign(.center)
                    Markdown(cssClass: "about_text markdown-body",
                        """
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
            }
            generateAboutCard("g-about-me", title: "About Me") {
                VStack {
                    HStack(justify: .spaceAround, align: .center, wrap: .reverse) {
                        Markdown(cssClass: "about-me",
                            """
                            My name's John Garrett. I stuided at UNCC for a bit, then Georgia Tech for a bit. After covid hit, I decided to take a break from school.
                            
                            I'm really intertested in ​Rugby, Reverse Engineering, Pebble Watches, Kernels, Vintage Computing, and Jailbreak Development to name a few.

                            There aren't enough hours in the day to finish every project no matter how hard I try.

                            I'm always open to new oppurtunities and work, if you're interested here's my [formal resume](https://garrepi.dev/files/resume.pdf)

                            Feel free to reach out to me on twitter @garrepi!
                            """
                        )
                        .maxWidth(500)
                        .textAlign(.left)
                        .padding(top: 0, right: 20, bottom: 0, left: 10)
                        Div {
                            Image(url: "https://garrepi.dev/images/avatar.png")
                                .height(200)
                                .width(200)
                                .rawCSS("place-self", "center")
                        }.display(.grid)
                    }
                    Header(.header3) { "Social Links" }
                        .textAlign(.center)
                        .font(weight: .fourhundred, size: 30, family: "SF Mono")
                        .margin(top: 10, bottom: 10)
                    Div("about-links") {
                        VStack(align: .center) {
                            Link(href: "https://twitter.com/garrepi") {
                                HStack(justify: .spaceAround, align: .center) {
                                    Image(url: "https://garrepi.dev/images/twitter.png")
                                        .width(30).height(30)
                                    Paragraph("@garrepi")
                                        .margin(0)
                                }
                            }.width(100, .percent)
                            .rawCSS("cursor", "pointer")
                            .margin(top: 10)
                            Link(href: "https://github.com/johngarrett") {
                                HStack(justify: .spaceAround, align: .center) {
                                    Image(url: "https://garrepi.dev/images/github.png")
                                        .width(30).height(30)
                                    Paragraph("/johngarrett")
                                        .margin(0)
                                }
                            }.width(100, .percent)
                            .rawCSS("cursor", "pointer")
                            .margin(top: 10, bottom: 10)
                            Link(href: "https://linkedin.com/in/johngarrettt") {
                                HStack(justify: .spaceAround, align: .center) {
                                    Image(url: "https://garrepi.dev/images/linkedin.png")
                                        .width(30).height(30)
                                    Paragraph("/johngarrett")
                                        .margin(0)
                                }
                            }.width(100, .percent)
                            .rawCSS("cursor", "pointer")
                            .margin(bottom: 10)
                        }
                    }.padding(right: 10, left: 10, .percent)
                }
            }
        }
        .display(.grid)
        .rawCSS("grid-template-columns", "minmax(320px, .4fr) minmax(400px, .6fr)")
        .alignItems(.baseline)
        .justifyContent(.center)
        .gridGap(2, .em)
        .margin(top: 40, right: 40, bottom: 40, left: 20)
        .inject(
            """
            \n
            @media (max-width: 944px) {
                .g-about-grid {
                    grid-template-columns: minmax(300px, 1fr);
                }
            }
            \n
            """
        )
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
