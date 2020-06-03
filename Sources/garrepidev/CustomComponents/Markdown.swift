import Foundation
import Ink

public class Markdown: SimpleHTMLComponent {
    private var parser = MarkdownParser()
    override public func render() -> String {
        parser.html(from: self.text)
    }
    
    public init(attributes: [String:String] = ["class": "g_markdown"], _ text: String) {
        super.init(text, attributes: attributes, .div)
    }
}
