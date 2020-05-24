import Foundation

class HTMLComponent: Displayable {
    var tag: HTMLTag
    var attributes: [String: String]?
    var childComponents: [HTMLComponent]?
    private let id: Int
    
    func render() -> String {
        var renderedComponents = ""
        for component in childComponents ?? [] {
            renderedComponents.append(component.render())
        }
        return tag.opening(attributes) + renderedComponents + tag.closing()
    }

    init (_ tag: HTMLTag, attributes: [String: String]? = nil, _ childComponents: [HTMLComponent]? = nil) {
        self.tag = tag
        self.attributes = attributes
        self.childComponents = childComponents
        self.id = UUID.init().hashValue
    }
}


extension HTMLComponent {
    convenience init(_ tag: HTMLTag? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> HTMLComponent) {
        self.init(
            tag ?? HTMLTag.empty,
            attributes: attributes,
            [component()]
        )
    }
    
    convenience init(_ tag: HTMLTag, attributes: [String: String]? = nil, @HTMLComponentBuilder _ components: () -> [HTMLComponent]) {
           self.init(
               tag,
               attributes: attributes,
               components()
           )
       }
    
    convenience init(_ tag: HTMLTag, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> String) {
        self.init(
            tag,
            attributes: attributes,
            [RawText(component())]
        )
    }
}

@_functionBuilder
struct HTMLComponentBuilder {
    static func buildBlock(_ components: HTMLComponent...) -> HTMLComponent {
        return HTMLComponent(.empty, components)
    }
}

extension HTMLComponent: Equatable {
    static func == (lhs: HTMLComponent, rhs: HTMLComponent) -> Bool {
        return lhs.id == rhs.id
    }
}
