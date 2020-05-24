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
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="styles.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
          <title>\(title)</title>
        </head>
        """
    }
    
    init(title: String) {
        self.title = title
        super.init(.head)
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

