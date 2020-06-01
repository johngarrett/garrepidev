import Foundation

class HTMLComponent: HTMLElement {
    var tag: HTMLTag
    var className: String
    var attributes: [String: String]
    var childComponents: [HTMLElement]?

    func render() -> String {
        var renderedComponents = ""
        for component in childComponents ?? [] {
            renderedComponents.append(component.render())
        }
        return tag.opening(attributes) + renderedComponents + tag.closing()
    }
    
    init (_ tag: HTMLTag, className: String = "", attributes: [String: String] = ["": ""], _ childComponents: [HTMLElement]? = nil) {
        self.tag = tag
        self.attributes = attributes
        self.childComponents = childComponents
        self.className = className
        self.attributes["class"] = className
    }
}


extension HTMLComponent {
    convenience init(_ tag: HTMLTag? = nil, className: String? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> HTMLElement) {
        self.init(
            tag ?? HTMLTag.empty,
            className: className ?? "",
            attributes: attributes ?? ["":""],
            [component()]
        )
    }
    
    convenience init(_ tag: HTMLTag, className: String? = nil,  attributes: [String: String]? = nil, @HTMLComponentBuilder _ components: () -> [HTMLElement]) {
           self.init(
               tag,
               className: className ?? "",
               attributes: attributes ?? ["":""],
               components()
           )
       }
    
    convenience init(_ tag: HTMLTag, className: String? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> String) {
        self.init(
            tag,
            className: className ?? "",
            attributes: attributes ?? ["":""],
            [RawText(component())]
        )
    }
}

@_functionBuilder
struct HTMLComponentBuilder {
    static func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
}

extension HTMLComponent: Equatable {
    static func == (lhs: HTMLComponent, rhs: HTMLComponent) -> Bool {
        return lhs.className == rhs.className
    }
}
