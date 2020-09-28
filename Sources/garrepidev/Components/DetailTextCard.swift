import Foundation
import HyperSwift
import Ink

public class MarkdownContent: HTMLComponent {
    init(from text: String) {
        let parser = MarkdownParser()
        let card: HTMLComponent =
            Div("g_markdown_content") {
                """
                <style>
                    img {max-width: 90%;}
                </style>
                \(parser.html(from: text))
                """
            }
            .font(weight: .normal, size: 16, family: "CrimsonText")
            .textAlign(.left)
        super.init(.empty, [card])
    }
}
