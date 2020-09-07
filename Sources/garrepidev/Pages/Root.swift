import Foundation
import HyperSwift

public class Root: HTMLComponent {
    public let head: Head
    override public func render() -> String {
        let body = Div("g_body") {
            Sidebar().render()
            Div("g_contet") {
                childComponents?.compactMap { $0 } ?? []
            }
        }
        .display(.grid)
        .height(100, .percent)
        .width(100, .percent)
        .rawCSS("grid-template-columns", "15% 85%")
        
        return """
        <!DOCTYPE html>
        <html lang="en">
            \(head.render())
            <body style="margin: 0; background-color: #b5b5b5; height: 100vh; width: 100%;">
                \(body.render())
            </body>
        </html>
        """
    }
    
    public init(_ head: Head, _ components: [HTMLComponent]?) {
        self.head = head
        super.init(.head, components)
    }
}

public class Head: HTMLComponent {
    let title: String
    let stylesheets: [String] 
    
    override public func render() -> String {
        """
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            \(stylesheets.joined(separator: "\n"))
          <title>\(title)</title>
        </head>
        """
    }
    
    public init(title: String, stylesheets: [String]? = nil) {
        self.title = title
        self.stylesheets = stylesheets ?? []
        super.init(.head)
    }
}

extension Root {
    convenience public init(title: String, @RootBuilder _ components: () -> [HTMLComponent]) {
        self.init(
            Head(title: title),
            components()
        )
    }
    convenience public init(title: String, @RootBuilder _ component: () -> HTMLComponent) {
        self.init(
            Head(title: title),
            [component()]
        )
    }
}
@_functionBuilder
public struct RootBuilder {
    static public func buildBlock(_ components: HTMLComponent...) -> HTMLComponent {
        return HTMLComponent(.empty, components)
    }
}

