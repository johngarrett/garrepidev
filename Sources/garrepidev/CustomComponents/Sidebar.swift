import Foundation

public struct Sidebar: ComponentType {
    public func render() -> HTMLComponent {
        HTMLComponent(.div, className: GClasses.sidebar.rawValue) {
            HTMLComponent(.div) {
                Link("Projects", href: ProjectsOverview.absoluteAddress)
                Link("Blog", href: BlogOverview.absoluteAddress)
                Link("About", href: About.absoluteAddress)
            }
            .padding(top: 20, left: 20, .percentage)
            .rawCSS("margin", "0 auto")
            .rawCSS("text-decoration", "none")
            .color(GColors.black)
            .display(.block)
            .textAlign(.left)
        }
            
        .height(100, .percentage)
        .width(15, .percentage)
        .maxWidth(175)
        .backgroundColor(GColors.white)
        .position(top: 0, left: 0)
        .zIndex(1)
        .rawCSS("float", "left")
        .rawCSS("position", "fixed")
        .rawCSS("overflow-x", "hidden")
        .rawCSS("border-right", "3px solid #ffffff")
    }
    
    public func change(to page: GPage) {
        print("switch to \(page)")
    }
    private func makeLink(_ title: String, href: String) -> HTMLComponent {
        // TODO: make these extensions work on simpleHTMLComponenet... or get rid of it
        SimpleHTMLComponent(title, attributes: ["href": href], .a)
            .padding(top: 20, .percentage)
            .textDecoration(.none)
            .font(weight: "regular", size: 20, family: "SF Mono")
            .textAlign(.left)
    }
}
