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
        Root(head, [body.render()]).render()
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
                return BlogDetail(
                    with: Post(
                        "Fake title for the blog detail view",
                        date: "07/10/2000",
                        abstract: "Here is an abstract for this fake post",
                        imageURL: "https://static.boredpanda.com/blog/wp-content/uploads/2019/04/funny-dancing-cats-fb3.png",
                        body: "Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?",
                        [Tag("Tag1"), Tag("Tag2")],
                        href: title
                    )
                )!
            case .ProjectsOverview:
                return projectsOverview
            case .ProjectDetail:
                return ProjectDetail(
                    with: Project(
                        "Fake Project",
                        abstract: "This is a project I _really_ did work on",
                        imageURL: "https://static.boredpanda.com/blog/wp-content/uploads/2019/04/funny-dancing-cats-fb3.png",
                        readme: "Please read me!Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?Hello! I *am* garrepi. I _am_ typing out a ~~sentence~~  can you see this?",
                        [Tag("Swift"), Tag("Rust")],
                        href: title
                    )
                )!
            case .FiveHundred:
                return FiveHundred()
            default:
                return FourOFour()
            }
        }()
    }
}
