import Foundation

public class HTMLComponent: HTMLElement {
    public var tag: HTMLTag
    public var className: String
    public var attributes: [String: String]
    public var childComponents: [HTMLElement]?

    public func render() -> String {
        var renderedComponents = ""
        for component in childComponents ?? [] {
            renderedComponents.append(component.render())
        }
        return tag.opening(attributes) + renderedComponents + tag.closing()
    }
    
    public init (_ tag: HTMLTag, className: String = "", attributes: [String: String] = ["": ""], _ childComponents: [HTMLElement]? = nil) {
        self.tag = tag
        self.attributes = attributes
        self.childComponents = childComponents
        self.className = className
        self.attributes["class"] = className
    }
}

extension HTMLComponent {
    convenience public init(_ tag: HTMLTag? = nil, className: String? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> HTMLElement) {
        self.init(
            tag ?? HTMLTag.empty,
            className: className ?? "",
            attributes: attributes ?? ["":""],
            [component()]
        )
    }
    
    convenience public init(_ tag: HTMLTag, className: String? = nil,  attributes: [String: String]? = nil, @HTMLComponentBuilder _ components: () -> [HTMLElement]) {
           self.init(
               tag,
               className: className ?? "",
               attributes: attributes ?? ["":""],
               components()
           )
       }
    
    convenience public init(_ tag: HTMLTag, className: String? = nil, attributes: [String: String]? = nil, @HTMLComponentBuilder _ component: () -> String) {
        self.init(
            tag,
            className: className ?? "",
            attributes: attributes ?? ["":""],
            [RawText(component())]
        )
    }
}

@_functionBuilder
public struct HTMLComponentBuilder {
    static public func buildBlock(_ components: HTMLElement...) -> HTMLElement {
        return HTMLComponent(.empty, components)
    }
}

extension HTMLComponent: Equatable {
    public static func == (lhs: HTMLComponent, rhs: HTMLComponent) -> Bool {
        return lhs.className == rhs.className
    }
}
