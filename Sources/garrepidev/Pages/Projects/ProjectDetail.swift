import Foundation
import HyperSwift

public struct ProjectDetail: HTMLPage {
    public let project: Project
    public var href: String
    public var title: String
    
    public func render() -> HTMLComponent {
        HStack("g_project_detail", justify: .center, align: .center, wrap: .reverse) {
            Div("g_project_detail_writeup") {
                MarkdownContent(from: project.readme)
            }
            .backgroundColor(GColors.white)
            .shadow(x: 20, y: 30, color: GColors.cardShadow)
            .border(1, .solid, color: CSSColor("#000000"))
            .display(.inlineBlock)
            .margin(3, .percent)
            .padding(top: 1, right: 2, bottom: 1, left: 2, .percent)
            .maxWidth(700, .px)
            
            ProjectCard(from: project, trackClick: false)
        }
        .minHeight(100, .percent)
        .inject(
            """
            \n
            @media (max-width: 666px) {
                .g_project_detail_writeup {
                    margin: 0;
                    width: 100%;
                    border: unset;
                    box-shadow: unset;
                }
                .g_project_detail > .g_project_card {
                    width: 80%;
                    margin-bottom: 60px;
                }
            }
            \n
            """
        )
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
