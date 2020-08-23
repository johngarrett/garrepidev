import Foundation
import HyperSwift

public class Root: HTMLComponent {
    public let head: Head
    override public func render() -> String {
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
    
    public init(_ head: Head, _ components: [HTMLComponent]?) {
        self.head = head
        super.init(.head, components)
    }
}

public class Head: HTMLComponent {
    let title: String
    
    override public func render() -> String {
        """
        <head>
            <meta charset="utf-8">
            <link rel="stylesheet" href="css/styles.css">
            <link rel="stylesheet" href="css/styles2.css">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" type="text/css" href="https://sf.abarba.me/font.css">
          <title>\(title)</title>
        </head>
        """
    }
    
    public init(title: String) {
        self.title = title
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

