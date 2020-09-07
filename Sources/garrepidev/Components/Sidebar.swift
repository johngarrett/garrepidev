import Foundation
import HyperSwift

public struct Sidebar: ComponentType {
    public init() { } 
    public func render() -> HTMLComponent {
        VStack("g_sidebar", justify: .flexStart) {
            VStack("g_sidebar_links", justify: .spaceAround){
                makeLink("⑊ PROJECTS", href: ProjectsOverview.absoluteAddress)
                makeLink("✑ BLOG", href: BlogOverview.absoluteAddress)
                makeLink("π ABOUT", href: About.absoluteAddress)
            }
            .display(.flex)
            .textAlign(.left)
            .height(10, .percent)
            .minHeight(150)
            .width(80, .percent)
            .padding(15, .percent)
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
