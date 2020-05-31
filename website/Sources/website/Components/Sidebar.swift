import Foundation

struct Sidebar: ComponentType {
    func render() -> HTMLComponent {
        HTMLComponent(.div, className: GClasses.sidebar.rawValue) {
            HTMLComponent(.div) {
                SimpleHTMLComponent("Projects", attributes: ["href": Projects.relativeAddress], .a)
                SimpleHTMLComponent("Blog", attributes: ["href": Blog.relativeAddress], .a)
                SimpleHTMLComponent("About", attributes: ["href": About.relativeAddress], .a)
            }
            .padding(top: 20, left: 20, .percentage)
            .rawCSS("margin", "0 auto")
        }
            
        .height(100, .percentage)
        .width(15, .percentage)
        .maxWidth(175)
        .backgroundColor(GColors.gray)
        .shadow(x: 5, y: 2, spread: 5, blur: 11, color: GColors.sidebarShadow)
        .position(top: 0, left: 0)
        .zIndex(1)
        .rawCSS("float", "left")
        .rawCSS("position", "fixed")
        .rawCSS("overflow-x", "hidden")
        .saveToStyleSheet()
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
