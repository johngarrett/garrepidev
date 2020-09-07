import Foundation
import HyperSwift
import garrepidev

public class GBase: HTMLComponent {
    public let head: Head
    public let sidebar = Sidebar()
    public var body: HTMLPage
    public let about: About
    public let blogOverview: BlogOverview
    public let projectsOverview: ProjectsOverview
    
    public override func render() -> String {
        let view = HTMLComponent {
            sidebar.render()
            HStack("g_content", justify: .center, wrap: .wrap) {
                body.render()
            }
            .margin(right: 7.5, left: 15, .percent)
        }
        return """
        <!DOCTYPE html>
        <html lang="en">
            \(head.render())
            <body style="width: 100%; height: 100%; margin: 0; background-color: #b5b5b5;">
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
    
    public func change(to page: GPage, title: String = "") {
        self.body = {
            switch page {
            case .About:
                return about
            case .BlogOverview:
                return blogOverview
            case .BlogDetail:
                return FourOFour()
            case .ProjectsOverview:
                return projectsOverview
            case .ProjectDetail:
                return FourOFour()
            case .FiveHundred:
                return FiveHundred()
            default:
                return FourOFour()
            }
        }()
        
        sidebar.change(to: page)
    }
}
