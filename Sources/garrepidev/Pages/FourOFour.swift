import Foundation

public struct FourOFour: HTMLPage {
    public var sidebar: ComponentType = Sidebar()
    public static var absoluteAddress: String = "/404"
    
    public func render() -> HTMLComponent {
        SimpleHTMLComponent("404", cls: "g_404", .paragraph)
    }
}
