import Foundation

class PostCard: HTMLComponent {
    init(_ title: String, abstract: String, imgURL: String, _ tags: [Tag]) {
        let card =
            HTMLComponent(.div, className: GClasses.blogCard.rawValue) {
                HTMLComponent(.div, className: GClasses.horizontal.rawValue) {
                    HTMLComponent(.div) {
                        HTMLComponent(.header1) { title }
                            .font(weight: "bold", size: 25, family: "SF Mono")
                        Markdown(abstract)
                        HTMLComponent(.div, className: GClasses.horizontal.rawValue) {
                            tags
                        }
                    }
                    Image(url: imgURL)
                       .margin(right: 5, left: 5, .percentage)
                       .width(90, .percentage)
                       .maxHeight(250)
                       .objectFit(.cover)
                }
                .rawCSS("display", "flex")
                .rawCSS("flex-direction", "row")
                .rawCSS("align-items", "center")
                .rawCSS("justify-content", "space-between")
                
            }
            .wordWrap(.brk)
            .width(80, .percentage)
            .minHeight(200)
            .borderRadius(15)
            .backgroundColor(GColors.white)
            .padding(right: 20, left: 20)
            .margin(top: 10, right: 10, left: 30)
            .shadow(y: 2, spread: 4, blur: 16, color: GColors.cardShadow)
        
        super.init(.empty, [card])
    }
}
extension PostCard {
    convenience init(from post: Post) {
        self.init(post.title, abstract: post.abstract, imgURL: post.imageURL ?? "", post.tags)
    }
}
