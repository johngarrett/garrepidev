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
        Root(head, body).render()
    }
    
    public init(_ head: Head, _ about: About, _ blogOverview: BlogOverview, _ projectsOverview: ProjectsOverview) {
        self.head = head
        self.body = about
        self.about = about
        self.blogOverview = blogOverview
        self.projectsOverview = projectsOverview
        super.init(.head)
    }
    
    public func change(to page: GPage, at href: String = "") {
        self.body = {
            switch page {
            case .About:
                return about
            case .BlogOverview:
                return blogOverview
            case .BlogDetail:
                return blogOverview.blogDetailPages.first(where: {$0.post.href == href}) ?? FourOFour()
            case .ProjectsOverview:
                return projectsOverview
            case .ProjectDetail:
                return projectsOverview.projectDetailPages.first(where: {$0.project.href == href}) ?? FourOFour()
            case .FiveHundred:
                return FiveHundred()
            default:
                return FourOFour()
            }
        }()
    }
}
