import Foundation

struct Blog: HTMLPage {
    var sidebar: ComponentType = Sidebar()
    static var relativeAddress = "blog.html"
    
    func render() -> HTMLComponent {
        Paragraph("Hello all!")
    }
}
