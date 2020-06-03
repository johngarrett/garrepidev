import Foundation
public struct About: HTMLPage {
    public var sidebar: ComponentType = Sidebar()
    static public var relativeAddress = "about"
    public func render() -> HTMLComponent {
        HTMLComponent {
            HTMLComponent(.header1) { "About" }
                .color(GColors.black)
                .font(weight: "bold", size: 45, family: "SF Mono")
                .padding(top: 10, bottom: 10)
                
            Paragraph(
                    """
                    Welcome to my website. Here is where I host all my projects and blogs.
                    See below for more information.

                    This website was written 100% in swift
                    """
                )
            }
        }
    public init() { }
}
