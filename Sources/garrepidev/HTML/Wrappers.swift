import Foundation

public class SimpleHTMLComponent: HTMLComponent {
    public let text: String!
    public init(_ text: String, attributes: [String: String] = ["":""], _ tag: HTMLTag) {
        self.text = text
        super.init(tag, attributes: attributes)
    }
    
    override public func render() -> String {
        self.tag.opening(attributes) +
        self.text +
        self.tag.closing()
    }
}

public class Paragraph: SimpleHTMLComponent {
    public init(attributes: [String:String] = ["class": "g_body_paragraph"], _ text: String) {
        super.init(text, attributes: attributes, .paragraph)
    }
}

public class Comment: SimpleHTMLComponent {
    public init(_ text: String) {
        super.init(text, .comment)
    }
}

public class RawText: HTMLElement {
    public var tag: HTMLTag = .empty
    public var className: String = ""
    public var attributes: [String : String] = ["":""]
    public var childComponents: [HTMLElement]? = nil
    public let rawString: String
    
    public func render() -> String {
        self.rawString
    }
    
    public init(_ rawString: String) {
        self.rawString = rawString
    }
}
