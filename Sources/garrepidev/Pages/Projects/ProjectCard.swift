import Foundation
import HyperSwift

public class ProjectCard: HTMLComponent {
    public init(title: String, tags: [Tag], text: String, imgURL: String, href: String, externalUrl: String) {
        let card =
            Div(GClasses.projectCard.rawValue, attributes: ["onclick": "location.href='\(href)';"]) {
                HTMLComponent(.header1) { title }
                    .font(weight: .bold, size: 26, family: "SF Mono")
                    .textAlign(.center)
                HStack(justify: .center) { tags }.textAlign(.center)
                Markdown(cssClass: "g_project_card_summary", text)
                    .textAlign(.center)
                    .font(weight: .normal, size: 13, family: "SF Mono")
                    .color(GColors.lightGray)
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
            .wordWrap(.brk)
            .maxWidth(550)
            .minHeight(300)
            .backgroundColor(GColors.white)
            .margin(top: 10, right: 10, bottom: 10, left: 10)
            .shadow(x: 20, y: 30, color: GColors.cardShadow)
            .border(1, .solid, color: CSSColor("#000000"))
        
        super.init(.empty, [card])
    }
}
extension ProjectCard {
    convenience init(from project: Project) {
        self.init(title: project.title, tags: project.tags, text: project.abstract, imgURL: project.imageURL ?? "", href: project.href, externalUrl: project.externalUrl ?? "")
    }
}
