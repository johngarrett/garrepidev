import Foundation

struct HTMLPage: Displayable {
    let head: HTMLHead
    let body: String
    func render() -> String {
        """
        <!doctype html>
        <html>
            \(head.render())
            <body>
                \(body)
            </body>
        </html>
        """
    }
    
    init(_ head: HTMLHead, _ body: String) {
        self.head = head
        self.body = body
    }
}

extension HTMLPage {
    init(head: HTMLHead, @HTMLComponentBuilder _ component: () -> HTMLComponent) {
        self.init(head, component().render())
    }
}

struct HTMLHead: Displayable {
    func render() -> String {
        """
        <head></head>
        """
    }
    init() {
        
    }
}
