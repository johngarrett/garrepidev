import Foundation

struct Sidebar: ComponentType {
    func render() -> HTMLComponent {
        HTMLComponent(.div, className: GClasses.sidebar.rawValue) {
            HTMLComponent(.div) {
                SimpleHTMLComponent("Projects", attributes: ["href": ProjectsOverview.relativeAddress], .a)
                SimpleHTMLComponent("Blog", attributes: ["href": BlogOverview.relativeAddress], .a)
                SimpleHTMLComponent("About", attributes: ["href": About.relativeAddress], .a)
                SimpleHTMLComponent("Sample Post", attributes: ["href": PostDetailView.relativeAddress], .a)
            }
            .padding(top: 20, left: 20, .percentage)
            .rawCSS("margin", "0 auto")
            .rawCSS("text-decoration", "none")
            .color(CSSColor("#ffffff"))
            .display(.block)
            .textAlign(.left)
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
