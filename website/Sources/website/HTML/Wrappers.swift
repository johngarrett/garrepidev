import Foundation

class SimpleHTMLComponent: HTMLComponent {
    let text: String!
    init(_ text: String, _ tag: HTMLTag) {
        self.text = text
        super.init(tag)
    }
    
    override func render() -> String {
        self.tag.opening() +
        self.text +
        self.tag.closing()
    }
}

class Paragraph: SimpleHTMLComponent {
    init(_ text: String) {
        super.init(text, .paragraph)
    }
}

class Comment: SimpleHTMLComponent {
    init(_ text: String) {
        super.init(text, .comment)
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
