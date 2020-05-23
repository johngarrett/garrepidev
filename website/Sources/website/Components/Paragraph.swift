import Foundation

struct Paragraph: HTMLComponent {
    func render() -> String {
        openingTag + body + closingTag
    }
    
    var openingTag: String
    var closingTag: String
    
    let body:String
    init(_ text: String) {
        openingTag = "<p>"
        closingTag = "</p>"
        self.body = text
    }
}
