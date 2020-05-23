import Foundation

class HTMLPage: HTMLComponent {
    let head: HTMLHead

    override func render() -> String {
        """
        <!doctype html>
        <html>
            \(head.render())
            <body>
                \(body ?? "")
            </body>
        </html>
        """
    }
    
    init(_ head: HTMLHead, _ body: String) {
        self.head = head
        super.init("<html>", body: body, "</html>")
    }
}

extension HTMLPage {
    convenience init(head: HTMLHead, @HTMLComponentBuilder _ component: () -> HTMLComponent) {
        self.init(head, component().render())
    }
}

class HTMLHead: HTMLComponent {
    init() {
        super.init("<head>", "</head>")
    }
}
