import Foundation
import HyperSwift

public class Root: HTMLComponent {
    public let head: Head
    
   
    
    override public func render() -> String {
        let body = Div("g_body") {
            Sidebar().render()
            Div("g_content") {
                childComponents?.compactMap { $0 } ?? []
            }
            .display(.grid)
            .overflow(.scroll)
        }
        .display(.grid)
        .add(
            styles:
                CSSStyle("grid-template-columns", "minmax(100px, 150px) 1fr"),
                CSSStyle("width", "100vw"),
                CSSStyle("height", "100vh")
        )
        .overflow(.hidden)
        .inject("""
         @media (max-width: 666px) {
                .g_content {
                    grid-template-columns: 100%;
                }
                .g_body {
                    grid-template-rows: 1fr;
                    grid-template-columns: unset;
                }
                .g_sidebar {
                    justify-content: flex-start;
                    flex-direction: row;
                    order: 1;
                }
                .g_sidebar_links {
                    flex-direction: row;
                    align-items: flex-start;
                    justify-content: space-around;
                }
                .g_sidebar-a {
                    margin: 0px;
                }
                .g_markdown_content {
                    padding: 20px;
                }
                .g_project_detail_writeup {
                    padding: 0px;
                }
            }
        """)
        
        return """
        <!DOCTYPE html>
        <html lang="en">
            \(head.render())
            <body style="margin: 0; background-color: \(SiteColors.bodyBackground.description);">
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
            <link rel="stylesheet" href="https://github.com/johngarrett/darkdown/raw/master/markdown.css" type="text/css">
          <title>\(title)</title>
            <!-- I know, I hate google anayltics. i'm looking for free alternatives - you can disable this if you'd like -->
            <script async src="https://www.googletagmanager.com/gtag/js?id=G-YZD103LZ87"></script>
            <script>
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());

              gtag('config', 'G-YZD103LZ87');
            </script>

            <meta name="description" content="My blogs, projects, and fight for semantic html">

            <meta property="og:url" content="https://garrepi.dev">
            <meta property="og:type" content="website">
            <meta property="og:title" content="garreπ">
            <meta property="og:description" content="My blogs, projects, and fight for semantic html">
            <meta property="og:image" content="https://www.garrepi.dev/images/avatar.jpg">
            <meta property="og:image:secure_url" content="https://www.garrepi.dev/images/avatar.jpg">

            <!-- Twitter Meta Tags -->
            <meta name="twitter:card" content="summary_large_image">
            <meta property="twitter:domain" content="garrepi.dev">
            <meta property="twitter:url" content="https://garrepi.dev">
            <meta name="twitter:title" content="garreπ">
            <meta name="twitter:description" content="My blogs, projects, and fight for semantic html">
            <meta name="twitter:image" content="https://www.garrepi.dev/images/avatar.jpg">

            <meta property="og:locale" content="en_US">
            <meta property="og:type" content="website">
            <meta property="og:site_name" content="garrepidev">
            <link rel="icon" type="image/jpeg" href="/images/avatar.jpg">
            <style>
            :root {
                \(SiteColors.all.map {
                    "--\($0.variableName): \($0.light.description);"
                }.joined(separator: "\n"))
            }
            @media (prefers-color-scheme: dark) {
                :root {
                    \(SiteColors.all.map {
                        "--\($0.variableName): \($0.light.description);"
                    }.joined(separator: "\n"))
                }
            }

            </style>
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
