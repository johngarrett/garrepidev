import Foundation

struct Projects: HTMLPage {
    var sidebar: ComponentType = Sidebar()
    static var relativeAddress = "projects.html"
    
    func render() -> HTMLComponent {
        HTMLComponent(.div, attributes: ["class": "g_cards"]) {
            HTMLComponent(.div, attributes: ["class": "g_card"]) {
                HTMLComponent(.div, attributes: ["class": "g_horizontal"]) {
                    HTMLComponent(.header1) { "Project's Name" }
                    HTMLComponent(.div, attributes: ["class": "g_code_tag"]) {
                        HTMLComponent(.paragraph) { "swift" }
                    }
                }
                Paragraph("Hello I am a card with a name and a personality!")
                SimpleHTMLComponent("", attributes: ["src": "https://code.visualstudio.com/assets/docs/editor/integrated-terminal/integrated-terminal.png"], .img)
            }
            HTMLComponent(.div, attributes: ["class": "g_card"]) {
                HTMLComponent(.div, attributes: ["class": "g_horizontal"]) {
                    HTMLComponent(.header1) { "Project's Name" }
                    HTMLComponent(.div, attributes: ["class": "g_code_tag"]) {
                        HTMLComponent(.paragraph) { "rust" }
                    }
                }
                Paragraph("Hello I am a card with  I hae more operosn pick me pick me picke me a name and a personality!")
            }
            HTMLComponent(.div, attributes: ["class": "g_card"]) {
                HTMLComponent(.div, attributes: ["class": "g_horizontal"]) {
                    HTMLComponent(.header1) { "Project's Name" }
                    HTMLComponent(.div, attributes: ["class": "g_code_tag"]) {
                        HTMLComponent(.paragraph) { "FORTRAN" }
                    }
                }
                Paragraph("Hello I am a card witPLEAS PIck lme i have so much personality. I am the card you Want!!!!! h a name and a personality!")
            }
        }
    }
}
