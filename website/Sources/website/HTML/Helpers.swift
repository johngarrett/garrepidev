import Foundation
enum HTMLTag: String {
    case html
    case head
    case comment = "!--"

    case title
    case header1 = "h1", header2 = "h2", header3 = "h3", header4 = "h4", header5 = "h5", header6 = "h6"
    
    case em
    case code
    case bold = "b"
    
    case nav
    case body
    case link
    case script
    case paragraph = "p"
    case ordered_list = "ol"
    case unordered_list = "ul"

    case br
    case div
    case footer
    
    case empty

    func opening(_ attributes: String? = nil) -> String {
        switch self {
        case .empty:
            return ""
        case .comment:
            return "<\(self.rawValue)"
        default:
            return "<\(self.rawValue)>\(attributes ?? "")"
        }
    }
    
    func closing() -> String {
        switch self {
        case .empty:
            return ""
        case .comment:
            return "-->"
        default:
            return "</\(self.rawValue)>"
        }
    }
}

