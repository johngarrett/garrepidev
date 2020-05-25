import Foundation

struct Sidebar: ComponentType {
    func render() -> HTMLComponent {
        HTMLComponent(.div, attributes: ["class": "g_sidebar"]) {
            HTMLComponent(.div) {
                SimpleHTMLComponent("Projects", attributes: ["href": Projects.relativeAddress], .a)
                SimpleHTMLComponent("Blog", attributes: ["href": Blog.relativeAddress], .a)
                SimpleHTMLComponent("About", attributes: ["href": About.relativeAddress], .a)
            }
            .padding(top: 20, left: 20, percentage: true)
            .rawCSS("margin", "0 auto")
        }
            
        .height(100, percentage: true)
        .width(15, percentage: true)
        .maxWidth(175)
        .backgroundColor("#CACACA")
        .shadow(x: 5, y: 2, spread: 5, blur: 11, color: "rgba(215, 215, 215, 0.5)")
        .position(top: 0, left: 0)
        .zIndex(1)
        .rawCSS("float", "left")
        .rawCSS("position", "fixed")
        .rawCSS("overflow-x", "hidden")
    }
    private func makeLink(_ title: String, href: String) -> HTMLComponent {
        // TODO: make these extensions work on simpleHTMLComponenet... or get rid of it
        SimpleHTMLComponent(title, attributes: ["href": href], .a)
            .padding(top: 20, percentage: true)
            .textDecoration(.none)
            .font(weight: "regular", size: 20, family: "SF Mono")
            .textAlign(.left)
    }
}
