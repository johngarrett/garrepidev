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
}
