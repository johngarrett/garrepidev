import Foundation

public class GBase: HTMLComponent {
    public let head: Head
    public let sidebar = Sidebar()
    public var body: HTMLPage
    public let about: About
    public let blogOverview: BlogOverview
    public let projectsOverview: ProjectsOverview
    
    override public func render() -> String {
       let view = HTMLComponent {
        sidebar.render()
        HTMLComponent(.div, className: "g_main") {
            HTMLComponent(.div) {
                body.render()
            }
        }
        .margin(left: 15, .percentage)
        .padding(top: 5, right: 20, left: 20)
        .rawCSS("position", "absolute")
        .rawCSS("float", "left")
        }
        return """
        <!DOCTYPE html>
        <html lang="en">
            \(head.render())
            <body>
            \(view.render())
            </body>
        </html>
        """
    }
    
    public init(_ head: Head, _ about: About, _ blogOverview: BlogOverview, _ projectsOverview: ProjectsOverview) {
        self.head = head
        self.body = about
        self.about = about
        self.blogOverview = blogOverview
        self.projectsOverview = projectsOverview
        super.init(.head)
    }
    
    public func change(to page: GPage) {
        self.body = {
            switch page {
            case .About:
                return about
            case .BlogOverview:
                return blogOverview
            case .ProjectsOverview:
                return projectsOverview
            }
        }()
        
        sidebar.change(to: page)
    }
}
