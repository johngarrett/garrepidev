import Foundation

struct Post {
    let title: String
    let abstract: String
    lazy var body: String = {
        "heyy"
    }()
    let imageURL: String?
    let tags: [Tag]
    
    init(_ title: String, abstract: String, imageURL: String? = nil, _ tags: Tag...) {
        self.title = title
        self.abstract = abstract
        self.imageURL = imageURL
        self.tags = tags
    }
}
