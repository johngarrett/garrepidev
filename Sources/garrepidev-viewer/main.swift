import garrepidev
import HyperSwift
import HyperView

print("hellow world")

let about = About()
func testPage(_ body: HTMLPage) {
    let head = Head(
        title: "hello",
        stylesheets: [
            "<link rel=\"stylesheet\" href=\"/styles.css\">"
        ]
    )

    let view = HTMLComponent {
        Sidebar().render()
        HStack("g_content", justify: .center, wrap: .wrap) {
            body.render()
        }
        .margin(right: 7.5, left: 15, .percent)
    }

    let htmlOutput =
    """
    <!DOCTYPE html>
    <html lang="en">
    \(head.render())
    <body style="width: 100%; height: 100%; margin: 0; background-color: #b5b5b5;">
    \(view.render())
    </body>
    </html>
    """

    let viewer = HyperView(view, path: "/about", cssPath: "/styles.css")
}

