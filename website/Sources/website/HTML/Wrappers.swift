import Foundation

class Paragraph: HTMLComponent {
    let text: String!
    init(_ text: String) {
        self.text = text
        super.init(.paragraph)
    }
    
    override func render() -> String {
        self.tag.opening() +
        self.text +
        self.tag.closing()
    }
}

class RawText: HTMLComponent {
    let rawString: String
    override func render() -> String {
        self.rawString
    }
    
    init(_ rawString: String) {
        self.rawString = rawString
        super.init(.empty)
    }
}
