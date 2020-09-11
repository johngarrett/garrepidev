import Foundation
import HyperSwift

public struct Sidebar: ComponentType {
    public init() { } 
    public func render() -> HTMLComponent {
        VStack("g_sidebar", justify: .flexStart) {
            HStack("g_sidebar_links", justify: .spaceAround, align: .center){
                makeLink("⑊ PROJECTS", href: ProjectsOverview.absoluteAddress)
                makeLink("✑ BLOG", href: BlogOverview.absoluteAddress)
                makeLink("π ABOUT", href: About.absoluteAddress)
            }
            .display(.flex)
            .textAlign(.center)
            .width(100, .percent)
            .height(100, .percent)
        }
        .height(100, .percent)
        .backgroundColor(GColors.white)
        .zIndex(1)
        .rawCSS("border-right", "1px solid #000000")
    }
    
    private func makeLink(_ title: String, href: String) -> HTMLComponent {
        Link(title, cls: "g_sidebar-a", href: href)
            .font(weight: "bold", size: 16, family: "SF Mono")
            .textDecoration(.none)
            .color(GColors.black)
            .wordWrap(.brk)
            .overflow(.hidden)
    }
}
