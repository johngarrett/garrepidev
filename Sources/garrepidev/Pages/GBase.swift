import Foundation

public class GBase: HTMLComponent {
    public let head: Head
    public let sidebar = Sidebar()
    public var body: HTMLPage
    public let about: About
    public let blogOverview: BlogOverview
    public let projectsOverview: ProjectsOverview
    
    override public func render() -> String {
        """
        <!DOCTYPE html>
        <html lang="en">
            \(head.render())
            <body>
            \(body.render())
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
