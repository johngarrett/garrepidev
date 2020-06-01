import Foundation

class SimpleHTMLComponent: HTMLComponent {
    let text: String!
    init(_ text: String, attributes: [String: String] = ["":""], _ tag: HTMLTag) {
        self.text = text
        super.init(tag, attributes: attributes)
    }
    
    override func render() -> String {
        self.tag.opening(attributes) +
        self.text +
        self.tag.closing()
    }
}

class Paragraph: SimpleHTMLComponent {
    init(attributes: [String:String] = ["class": "g_body_paragraph"], _ text: String) {
        super.init(text, attributes: attributes, .paragraph)
    }
}

class Comment: SimpleHTMLComponent {
    init(_ text: String) {
        super.init(text, .comment)
    }
}

class RawText: HTMLElement {
    var tag: HTMLTag = .empty
    var className: String = ""
    var attributes: [String : String] = ["":""]
    var childComponents: [HTMLElement]? = nil
    let rawString: String
    
    func render() -> String {
        self.rawString
    }
    
    init(_ rawString: String) {
        self.rawString = rawString
    }
}
