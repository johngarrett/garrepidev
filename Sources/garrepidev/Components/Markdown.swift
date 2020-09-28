import Foundation
import HyperSwift
import Ink

public class Markdown: SimpleHTMLComponent {
    private var parser: MarkdownParser!
    override public func render() -> String {
        Div(self.className) {
            self.parser.html(from: self.text)
        }.render()
    }
    
    public init(cssClass: String = "g_markdown", _ text: String) {
        self.parser = MarkdownParser()
        super.init(text, cssClass: cssClass, .div)
    }
}
