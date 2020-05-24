import Foundation

struct Projects: HTMLPage {
    var sidebar: ComponentType = Sidebar()
    static var relativeAddress = "projects.html"
    
    func render() -> HTMLComponent {
        HTMLComponent(.div, attributes: ["class": "g_cards"]) {
            ProjectCard(title: "Project's Name", codeTag: CodeTag("swift"), text: "Hello I am a card with personaltiy", imgURL: "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png")
            ProjectCard(title: "Project's Name", codeTag: CodeTag("rust"), text: "Hello I am a card with another persona lakpersonaltiy", imgURL: "")
            ProjectCard(title: "Project's Name", codeTag: CodeTag("fortran"), text: "Hello I am amore workds for me please card with personaltiy", imgURL: "")
        }
    }
}
