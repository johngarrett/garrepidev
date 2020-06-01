import Foundation

struct Projects: HTMLPage {
    private var projects: [ProjectPreview]
    var sidebar: ComponentType = Sidebar()
    static var relativeAddress = "projects.html"
    
    func render() -> HTMLComponent {
        HTMLComponent(.div, className: GClasses.projectCardsGrid.rawValue) {
            projects.map { ProjectCard(from: $0) }
        }
        .maxWidth(1200)
        .margin(right: 5, left: 5, .percentage)
        .rawCSS("display", "grid")
        .rawCSS("grid-gap", "1rem")
    }
    
    init() {
        self.projects = [
            ProjectPreview("Project's name",
                    body: "Hello I am a *card* `with` personality",
                    imageURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png",
                    Tag("swift"))
            ,ProjectPreview("Project's name",
                     body: "Hello I am a _card_ with personality",
                     imageURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png",
                     Tag("rust"))
            ,ProjectPreview("Project's name",
                     body: "Hello I am a card with personality",
                     imageURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png",
                     Tag("fortran")),
            ProjectPreview("Project's name",
                    body: "Hello I ~~am~~ a card with personality",
                    imageURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png",
                    Tag("basic"))
        ]
    }
}
