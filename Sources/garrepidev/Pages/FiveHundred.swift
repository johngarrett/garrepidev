import Foundation
import HyperSwift

public struct FiveHundred: HTMLPage {
    public var href: String = "/500"
    public var title: String = "garreπ | 500 error"
    
    public init() {}
    
    public func render() -> HTMLComponent {
        VStack("g_505", justify: .center, align: .center) {
            HStack(justify: .spaceEvenly, align: .center) {
                Image(url: "/images/error_bomb.png")
                    .width(100)
                    .height(100)
                Header(.header3) { "HTTP 500" }
                    .font(weight: .bold, size: 40, family: "SF Mono")
            }
            
            Paragraph(
                """
                If you're seeing this page, [garrepi.dev](www.garrepi.dev) is down.

                Most likely because I am hosting it on a 2010 dell laptop, raspberry pi, or iPhone 7...

                It should be back up shortly. If not, you can find the raw markdown of the blog here if you are so inclined to do so:

                [blog repo](https://github.com/johngarrett/garrepi-blog-posts)
                """
            ).font(weight: .normal, size: 16, family: "CrimsonText")
        }
        .backgroundColor(GColors.lightRed)
        .textAlign(.center)
        .margin(5, .percent)
        .display(.flex)
        .shadow(x: 20, y: 30, color: GColors.cardShadow)
        .padding(top: 1, right: 1, bottom: 1, left: 1, .percent)
        .border(1, .solid, color: CSSColor("#000000"))
    }
}
