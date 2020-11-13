import Foundation
import HyperSwift

public struct Sidebar: ComponentType {
    public init() { } 
    public func render() -> HTMLComponent {
        VStack("g_sidebar", justify: .flexStart) {
            VStack("g_sidebar_links", justify: .flexStart, align: .flexStart) {
                makeLink("⑊ PROJECTS", href: ProjectsOverview().href)
                    .margin(top: 5, bottom: 5)
                makeLink("✑ BLOG", href: BlogOverview().href)
                    .margin(top: 5, bottom: 5)
                makeLink("π ABOUT", href: About().href)
                    .margin(top: 5, bottom: 5)
            }
            .width(100, .percent)
        }
        .height(100, .percent)
        .padding(20)
        .backgroundColor(GColors.white)
        .border(1, .solid, color: CSSColor("#000000"))
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
