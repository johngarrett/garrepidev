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
            .display(.grid)
        }
        .display(.grid)
        .rawCSS("grid-template-rows", "40px 1fr")
        .rawCSS("width", "100vw")
        .rawCSS("height", "100vh")
        
        return """
        <!DOCTYPE html>
        <html lang="en">
            \(head.render())
            <body style="margin: 0; background-color: #b5b5b5;">
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
            <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
            \(stylesheets.joined(separator: "\n"))
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/4.0.0/github-markdown.css">
          <title>\(title)</title>
            <!-- I know, I hate google anayltics. i'm looking for free alternatives - you can disable this if you'd like -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=G-YZD103LZ87"></script>
            <script>
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());

              gtag('config', 'G-YZD103LZ87');
            </script>
            <meta property="og:locale" content="en_US" />
            <meta property="og:type" content="website" />
            <meta property="og:title" content="garreπ" />
            <meta property="og:description" content="My blogs, projects, and fight for semantic html" />
            <meta property="og:url" content="https://www.garrepi.dev/" />
            <meta property="og:site_name" content="garrepi dev" />
            <meta property="og:image" content="https://www.garrepi.dev/images/avatar.png" />
            <meta property="og:image:secure_url" content="https://www.garrepi.dev/images/avatar.png" />
            <meta property="og:image:type" content="image/jpeg" />
            <meta property="og:image:width" content="300" />
            <meta property="og:image:height" content="300" />
            <link rel="icon" type="image/jpeg" href="/images/avatar.jpg" />
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
