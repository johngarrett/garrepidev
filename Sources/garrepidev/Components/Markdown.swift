import Foundation
import HyperSwift
import Ink

public class Markdown: HTMLComponent {
    public var text: String

    public init(cssClass: String = "markdown-body g_markdown", _ text: String) {
        self.text = text
        super.init(
            Div(cssClass) { MarkdownParser().html(from: text) }
        )
    }
}
