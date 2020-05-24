import Foundation

struct Sidebar: ComponentType {
    func render() -> HTMLComponent {
        HTMLComponent(.div, attributes: ["class": "g_sidebar"]) {
            HTMLComponent(.div) {
                SimpleHTMLComponent("Projects", attributes: ["href": Projects.relativeAddress], .a)
                SimpleHTMLComponent("Blog", attributes: ["href": Blog.relativeAddress], .a)
                SimpleHTMLComponent("About", attributes: ["href": About.relativeAddress], .a)
            }
        }
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
