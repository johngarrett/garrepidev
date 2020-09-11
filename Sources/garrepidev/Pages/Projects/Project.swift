import Foundation
import Ink

public struct Project {
    public let title: String
    public let abstract: String
    public let imageURL: String?
    public let tags: [Tag]
    public let href: String
    public let readme: String

    public init(_ title: String, abstract: String, imageURL: String? = nil, readme: String, _ tags: [Tag], href: String) {
        self.title = title
        self.abstract = abstract
        self.imageURL = imageURL
        self.tags = tags
        self.readme = readme
        self.href = "projects/\(href)"
    }
    
    public init?(from url: URL, href: String) {
        guard let rawPost = try? String(contentsOfFile: url.path) else {
            return nil
        }
        let result = MarkdownParser().parse(rawPost)
        
        guard let title = result.metadata["title"],
            let abstract = result.metadata["abstract"],
            let tags = result.metadata["tags"] else {
                return nil
        }
        let tempTags = tags.split(separator: ",").map { Tag(String($0)) } // todo: split strings up in tag
        self.init(
            title,
            abstract: abstract,
            imageURL: result.metadata["image_url"],
            readme: result.html,
            tempTags,
            href: href
        )
    }
}