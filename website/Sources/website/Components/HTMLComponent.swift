import Foundation

enum HTMLTag: String {
    case h1 = "h1"
    case p = "p"
    case body = "body"
    case html = "html"
}

protocol HTMLComponentProtocol: Displayable {
    var openingTag: String { get set }
    var closingTag: String { get set }
}

struct HTMLComponent: HTMLComponentProtocol {
    var openingTag: String
    var closingTag: String
    
    func render() -> String {
        openingTag + closingTag
    }
}

extension HTMLComponentProtocol {
    init (_ openingTag: String, _ closingTag: String) {
        self.openingTag = openingTag
        self.closingTag = closingTag
    }
    
    init(_ tag: HTMLTag, @HTMLComponentBuilder _ component: () -> HTMLComponentProtocol) {
        self.init("<\(tag)>", "</\(tag)>", component)
    }
    
    init(_ openingTag: String, _ closingTag: String, @HTMLComponentBuilder _ component: () -> HTMLComponentProtocol) {
        self.init(
            openingTag.appending(component().openingTag),
            closingTag.appending(component().closingTag)
        )
    }
    
    init(@HTMLComponentBuilder _ component: () -> HTMLComponentProtocol) {
        self.init(component().openingTag, component().closingTag)
  }
}

@_functionBuilder
struct HTMLComponentBuilder {
    static func buildBlock(_ components: HTMLComponentProtocol...) -> HTMLComponent {
        var openingTag = ""
        var closingTag = ""
        for component in components {
            openingTag.append(component.openingTag)
            closingTag.append(component.closingTag)
        }
        
        return HTMLComponent(openingTag, closingTag)
    }
}
