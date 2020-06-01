import Foundation

struct Blog: HTMLPage {
    private var posts: [Post]
    var sidebar: ComponentType = Sidebar()
    static var relativeAddress = "blog.html"
    
    func render() -> HTMLComponent {
        HTMLComponent(.div, className: GClasses.blogCardsGrid.rawValue) {
            posts.map { PostCard(from: $0) }
        }
       .maxWidth(1200)
       .margin(right: 5, left: 5, .percentage)
       .rawCSS("display", "grid")
       .rawCSS("grid-gap", "1rem")
    }
    
    init() {
        self.posts = [
            Post("How to game on a laptop",
                 abstract:
                """
                    Everybody hates gaming on a laptop.
                    The depependence on windows, the thermal throttling, the weight, etc.
                    Why do people still do it and how can this get better?
                    """,
                 imageURL: "https://preview.redd.it/y5i47rqaob251.png?width=640&height=412&crop=smart&auto=webp&s=2a698b1887157d2a6947a9e1dc9881d7418ddecc",
                 Tag(topic: "Windows")
            ),
            Post("How to game on a laptop",
                 abstract:
                """
                    Everybody _hates_ gaming on a laptop.
                    The depependence on windows, the thermal throttling, the weight, etc.
                    Why do people still do it and how can this get better?
                    """,
                 imageURL: "https://preview.redd.it/y5i47rqaob251.png?width=640&height=412&crop=smart&auto=webp&s=2a698b1887157d2a6947a9e1dc9881d7418ddecc",
                 Tag(topic: "Form factor"), Tag("Windows")
            ),
            Post("How to game on a laptop",
                 abstract:
                """
                    Everybody hates *gaming* on a laptop.
                    The depependence on ~~windows~~, the thermal throttling, the weight, etc.
                    Why do people _still_ do it and how can this get better?
                    """,
                 imageURL: "https://preview.redd.it/y5i47rqaob251.png?width=640&height=412&crop=smart&auto=webp&s=2a698b1887157d2a6947a9e1dc9881d7418ddecc",
                 Tag(topic: "Product review")
            )
        ]
    }
}
