import Foundation
import HyperSwift

public struct ProjectsOverview: HTMLPage {
    private var projects: [Project?]
    static public var absoluteAddress = "/projects"
    
    public func render() -> HTMLComponent {
        Div(GClasses.projectCardsGrid.rawValue) {
            projects.compactMap { $0 }.map { ProjectCard(from: $0) }
        }
        .display(.grid)
        .gridGap(2, .rem)
    }
}
