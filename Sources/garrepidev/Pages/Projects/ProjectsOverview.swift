import Foundation

public struct ProjectsOverview: HTMLPage {
    private var projects: [Project]
    public var sidebar: ComponentType = Sidebar()
    static public var relativeAddress = "projects"
    
    public func render() -> HTMLComponent {
        HTMLComponent(.div, className: GClasses.projectCardsGrid.rawValue) {
            projects.map { ProjectCard(from: $0) }
        }
        .maxWidth(1200)
        .margin(right: 5, left: 5, .percentage)
        .rawCSS("display", "grid")
        .rawCSS("grid-gap", "1rem")
    }
    
    public init() {
        self.projects = [
            Project("Project's name",
                    body: "Hello I am a *card* `with` personality",
                    imageURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png",
                    Tag("swift"))
            ,Project("Project's name",
                     body: "Hello I am a _card_ with personality",
                     imageURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png",
                     Tag("rust"))
            ,Project("Project's name",
                     body: "Hello I am a card with personality",
                     imageURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png",
                     Tag("fortran")),
            Project("Project's name",
                    body: "Hello I ~~am~~ a card with personality",
                    imageURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png",
                    Tag("basic"))
        ]
    }
}
