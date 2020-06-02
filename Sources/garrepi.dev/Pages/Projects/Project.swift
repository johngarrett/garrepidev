import Foundation

struct Project {
    let title: String
    let body: String
    let imageURL: String?
    let tag: Tag
    
    init(_ title: String, body: String, imageURL: String? = nil, _ tag: Tag) {
        self.title = title
        self.body = body
        self.imageURL = imageURL
        self.tag = tag
    }
}
