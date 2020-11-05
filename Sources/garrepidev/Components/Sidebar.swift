import Foundation
import HyperSwift

public struct Sidebar: ComponentType {
    public init() { } 
    public func render() -> HTMLComponent {
        VStack("g_sidebar", justify: .flexStart) {
            HStack("g_sidebar_links", justify: .spaceAround, align: .center){
                makeLink("⑊ PROJECTS", href: ProjectsOverview().href)
                makeLink("✑ BLOG", href: BlogOverview().href)
                makeLink("π ABOUT", href: About().href)
            }
            .display(.flex)
            .textAlign(.center)
            .width(100, .percent)
            .height(100, .percent)
        }
        .height(100, .percent)
        .backgroundColor(GColors.white)
        .zIndex(1)
        .borderBottom(1, .solid, color: CSSColor("#000000"))
    }
    
    private func makeLink(_ title: String, href: String) -> HTMLComponent {
        Link("g_sidebar-a", href: href) { title }
            .font(weight: .bold, size: 16, family: "SF Mono")
            .textDecoration(.none)
            .color(GColors.black)
            .wordWrap(.brk)
            .overflow(.hidden)
    }
}
