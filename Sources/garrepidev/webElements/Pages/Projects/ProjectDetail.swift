import Foundation
import HyperSwift

public struct ProjectDetail: HTMLPage {
    public let project: Project
    static public var absoluteAddress: String = "testPost.html"
    
    public func render() -> HTMLComponent {
        HStack(justify: .center, align: .center, wrap: .reverse) {
            TextCard(with: project.readme)
            ProjectCard(from: project)
        }
    }
    
    public init?(with project: Project?) {
        guard let project = project else {
            return nil
        }
        self.project = project
    }
}
