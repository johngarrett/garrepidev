import Foundation
import HyperSwift

public struct ProjectDetail: HTMLPage {
    public let project: Project
    public var href: String
    public var title: String
    
    public func render() -> HTMLComponent {
        HStack("g_project_detail", justify: .center, align: .center, wrap: .reverse) {
            DetailTextCard(with: project.readme, for: .project)
                .shadow(x: 20, y: 30, color: GColors.cardShadow)
                .font(weight: .normal, size: 16, family: "CrimsonText")
                .margin(3, .percent)
                .maxWidth(80, .percent)
            ProjectCard(from: project)
        }
        .minHeight(100, .percent)
    }
    
    public init?(with project: Project?) {
        guard let project = project else {
            return nil
        }
        self.project = project
        self.href = project.href
        self.title = project.title
    }
}
