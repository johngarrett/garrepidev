import Foundation

class Paragraph: HTMLComponent {
    init(_ text: String) {
        super.init("<p>", body: text, "</p>")
    }
}
