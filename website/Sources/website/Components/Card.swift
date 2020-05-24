import Foundation

class ProjectCard: HTMLComponent {
    init(title: String, codeTag: CodeTag, text: String, imgURL: String) {
        let card =
            HTMLComponent {
                HTMLComponent(.div, attributes: ["class": "g_horizontal"]) {
                    HTMLComponent(.header1) { title }
                    codeTag
                }
                Paragraph(text)
                Image(url: imgURL)
        }
        
        super.init(.div, attributes: ["class": "g_card"], [card])
    }
}

class CodeTag: HTMLComponent {
    init(_ language: String) {
        let tag = HTMLComponent {
            HTMLComponent(.paragraph) { language }
        }
        super.init(.div, attributes: ["class": "g_code_tag"], [tag])
    }
}
