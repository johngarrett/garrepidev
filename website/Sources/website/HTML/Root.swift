import Foundation

class Root: HTMLComponent {
    let head: Head
    override func render() -> String {
        var renderedComponents = ""
        for component in childComponents ?? [] {
            renderedComponents.append(component.render())
        }
        
        return """
        <!DOCTYPE html>
        <html lang="en">
            \(head.render())
            <body>
                \(renderedComponents)
            </body>
        </html>
        """
    }
    
    init(_ head: Head, _ components: [HTMLComponent]?) {
        self.head = head
        super.init(.head, components)
    }
}

class Head: HTMLComponent {
    let title: String
    
    override func render() -> String {
        """
        <head>
          <title>\(title)</title>
        </head>
        """
    }
    
    init(title: String) {
        self.title = title
        super.init(.head, nil)
    }
}

extension Root {
    convenience init(title: String, @RootBuilder _ components: () -> [HTMLComponent]) {
        self.init(
            Head(title: title),
            components()
        )
    }
    convenience init(title: String, @RootBuilder _ component: () -> HTMLComponent) {
        self.init(
            Head(title: title),
            [component()]
        )
    }
}
@_functionBuilder
struct RootBuilder {
    static func buildBlock(_ components: HTMLComponent...) -> HTMLComponent {
        return HTMLComponent(.empty, components)
    }
}

