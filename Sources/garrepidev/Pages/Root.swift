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
            <!-- Analytical info, you can disable this if you'd like -->
            <script type="text/javascript">
              var _paq = window._paq = window._paq || [];
              /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
              _paq.push(['trackPageView']);
              _paq.push(['enableLinkTracking']);
              (function() {
                var u="https://garrepidev.matomo.cloud/";
                _paq.push(['setTrackerUrl', u+'matomo.php']);
                _paq.push(['setSiteId', '1']);
                var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
                g.type='text/javascript'; g.async=true; g.src='//cdn.matomo.cloud/garrepidev.matomo.cloud/matomo.js'; s.parentNode.insertBefore(g,s);
              })();
            </script>
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
