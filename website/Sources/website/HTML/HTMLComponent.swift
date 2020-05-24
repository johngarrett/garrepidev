import Foundation

class HTMLComponent: Displayable {
    var tag: HTMLTag
    var childComponents: [HTMLComponent]?
    private let id: Int
    
    func render() -> String {
        var renderedComponents = ""
        for component in childComponents ?? [] {
            renderedComponents.append(component.render())
        }
        
        return tag.opening() + renderedComponents + tag.closing()
    }

    init (_ tag: HTMLTag, _ childComponents: [HTMLComponent]? = nil) {
        self.tag = tag
        self.childComponents = childComponents
        self.id = UUID.init().hashValue
    }
}


extension HTMLComponent {
    convenience init(_ tag: HTMLTag, @HTMLComponentBuilder _ component: () -> HTMLComponent) {
        self.init(
            tag,
            [component()]
        )
    }
    
    convenience init(_ tag: HTMLTag, @HTMLComponentBuilder _ components: () -> [HTMLComponent]) {
           self.init(
               tag,
               components()
           )
       }
    
    convenience init(_ tag: HTMLTag, @HTMLComponentBuilder _ component: () -> String) {
        self.init(
            tag,
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
