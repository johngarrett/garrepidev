import Foundation
import Ink

class Markdown: SimpleHTMLComponent {
    private var parser = MarkdownParser()
    override func render() -> String {
        parser.html(from: self.text)
    }
    
    init(attributes: [String:String] = ["class": "g_markdown"], _ text: String) {
        super.init(text, attributes: attributes, .div)
    }
}
