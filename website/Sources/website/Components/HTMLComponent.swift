import Foundation

enum HTMLTag: String {
    case h1 = "h1"
    case p = "p"
    case body = "body"
    case html = "html"
}

class HTMLComponent: Displayable {
    var openingTag: String
    var closingTag: String
    var body: String?
    
    func render() -> String {
        openingTag + (body ?? "") + closingTag
    }
    
    init (_ openingTag: String, body:String? = nil, _ closingTag: String) {
        self.openingTag = openingTag
        self.closingTag = closingTag
        self.body = body
    }
}

extension HTMLComponent {
    convenience init(_ tag: HTMLTag, @HTMLComponentBuilder _ component: () -> HTMLComponent) {
        self.init("<\(tag)>", "</\(tag)>", component)
    }
    
    convenience init(_ openingTag: String, _ closingTag: String, @HTMLComponentBuilder _ component: () -> HTMLComponent) {
        self.init(
            openingTag.appending(component().openingTag),
            closingTag.appending(component().closingTag)
        )
    }
    
    convenience init(@HTMLComponentBuilder _ component: () -> HTMLComponent) {
        self.init(component().openingTag, component().closingTag)
  }
}

@_functionBuilder
struct HTMLComponentBuilder {
    static func buildBlock(_ components: HTMLComponent...) -> HTMLComponent {
        var openingTags = [String]()
        var closingTags = [String]()
        for component in components {
            openingTags.append(component.openingTag)
            closingTags.insert(component.closingTag, at: 0)
        }
        let body = components.last?.body ?? ""
        
        return HTMLComponent(openingTags.joined(), body: body, closingTags.joined())
    }
}
