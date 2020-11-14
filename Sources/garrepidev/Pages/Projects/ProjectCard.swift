import Foundation
import HyperSwift

public class ProjectCard: HTMLComponent {
    public init(title: String, tags: [Tag], text: String, imgURL: String, href: String, externalUrl: String) {
        let card =
            Div(GClasses.projectCard.rawValue, attributes: ["onclick": "location.href='\(href)';"]) {
                HTMLComponent(.header1) { title }
                    .font(weight: .bold, size: 26, family: "SF Mono")
                    .textAlign(.center)
                    .color(SiteColors.primaryText)
                HStack(justify: .center) { tags }.textAlign(.center)
                Markdown(cssClass: "g_project_card_summary", text)
                    .textAlign(.center)
                    .font(weight: .normal, size: 13, family: "SF Mono")
                    .color(SiteColors.secondaryText)
                    .margin(right: 10, left: 10, .percent)
                Image(url: imgURL)
                    .margin(right: 5, left: 5, .percent)
                    .width(90, .percent)
                    .maxHeight(250)
                    .objectFit(.cover)
                HTMLComponent(.a, attributes: ["href": externalUrl], [Paragraph("External Link")])
                    .width(100, .percent)
                    .textAlign(.center)
                    .textDecoration(.none)
            }
            .wordWrap(.breakWord)
            .maxWidth(550)
            .minHeight(300)
            .backgroundColor(SiteColors.elementBackground)
            .margin(top: 10, right: 30, bottom: 10, left: 10)
            .shadow(x: 20, y: 30, color: CSSColor(from: SiteColors.cardShadow))
            .border(1, .solid, color: CSSColor("#000000"))
            .add(style: CSSStyle("cursor", "pointer"))
            .inject(
                """
                @media (max-width: 500px) {
                    \(GClasses.projectCard.rawValue) {
                        box-shadow: rgba(0, 0, 0, 0.6) 10px 20px 0px 0px;
                    }
                    \(GClasses.projectCard.rawValue):hover {
                        box-shadow: rgba(0, 0, 0, 0.6) 15px 25px 0px 0px;
                    }
                }
                """
            )
        
        super.init(.empty, [card])
    }
}
extension ProjectCard {
    convenience init(from project: Project, trackClick: Bool=true) {
        self.init(title: project.title, tags: project.tags, text: project.abstract, imgURL: project.imageURL ?? "", href: trackClick ? project.href : "", externalUrl: project.externalUrl ?? "")
    }
}
