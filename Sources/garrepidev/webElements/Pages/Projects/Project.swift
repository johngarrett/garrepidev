import Foundation
import Ink

public struct Project {
    let title: String
    let abstract: String
    let imageURL: String?
    let tags: [Tag]
    let href: String
    let readme: String

    init(_ title: String, abstract: String, imageURL: String? = nil, readme: String, _ tags: [Tag], href: String) {
        self.title = title
        self.abstract = abstract
        self.imageURL = imageURL
        self.tags = tags
        self.readme = readme
        self.href = "projects/\(href)"
    }
    
//    public init?(from name: String) {
//        let thisFile = File("~/dev/g-server/Sources/g-server/projects/\(name).md")
//        guard let rawPost = try? thisFile.readString() else {
//            return nil
//        }
//        let result = MarkdownParser().parse(rawPost)
//
//        guard let title = result.metadata["title"],
//            let abstract = result.metadata["abstract"],
//            let tags = result.metadata["tags"] else {
//                return nil
//           }
//        let tempTags = tags.split(separator: ",").map { Tag(String($0)) } // todo: split strings up in tag
//        self.init(title, abstract: abstract, imageURL: result.metadata["image_url"], readme: result.html, tempTags, href: name)
//    }
}
