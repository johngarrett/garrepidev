import Foundation
import HyperSwift

public struct Sidebar: ComponentType {
    public init() { } 
    public func render() -> HTMLComponent {
        VStack("g_sidebar", justify: .flexStart) {
            VStack("g_sidebar_links", justify: .flexStart, align: .flexStart) {
                makeLink("⑊ PROJECTS", href: ProjectsOverview().href)
                    .margin(5, for: .vertical)
                makeLink("✑ BLOG", href: BlogOverview().href)
                    .margin(5, for: .vertical)
                makeLink("π ABOUT", href: About().href)
                    .margin(5, for: .vertical)
            }
            .width(100, .percent)
        }
        .height(100, .percent)
        .padding(20)
        .backgroundColor(CSSColor(from: SiteColors.elementBackground))
        .border(1, .solid, color: CSSColor("#000000"))
    }
    
    private func makeLink(_ title: String, href: String) -> HTMLComponent {
        Link("g_sidebar-a", href: href) { title }
            .font(weight: .bold, size: 16, family: "SF Mono")
            .textDecoration(.none)
            .color(CSSColor(from: SiteColors.primaryText))
            .wordWrap(.breakWord)
            .overflow(.hidden)
    }
}
