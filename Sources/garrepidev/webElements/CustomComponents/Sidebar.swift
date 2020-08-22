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
        .width(15, .percent)
        .maxWidth(175)
        .minWidth(30)
        .backgroundColor(GColors.white)
        .position(top: 0, left: 0)
        .zIndex(1)
        .rawCSS("float", "left")
        .rawCSS("position", "fixed")
        .rawCSS("overflow-x", "hidden")
        .rawCSS("border-right", "1px solid #000000")
    }
    
    public func change(to page: GPage) {
        print("switch to \(page)")
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
