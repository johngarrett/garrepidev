import Foundation

class Header: SimpleHTMLComponent {
    init(_ style: HTMLTag = .header1, text: String, cls: String = "", attributes: [String: String] = ["":""]) {
        super.init(text, attributes: attributes, style);
        self.attributes["class"] = cls
    }
}

extension Header {
    convenience init(_ style: HTMLTag = .header1, cls: String = "", attributes: [String: String] = ["":""], @HeaderBuilder _ text: () -> String) {
        self.init(
            style,
            text: text(),
            cls: cls,
            attributes: attributes
        )
    }
}

@_functionBuilder
struct HeaderBuilder {
    static func buildBlock(_ text: String) -> String {
        text
    }
}
