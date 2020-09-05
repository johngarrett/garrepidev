import Foundation
import Ink

public struct Post {
    public let title: String
    public let date: String
    public let abstract: String
    public let body: String
    public let imageURL: String?
    public let tags: [Tag]
    public let href: String
    
    public init(_ title: String, date: String, abstract: String, imageURL: String? = nil, body: String, _ tags: [Tag], href: String) {
        self.title = title
        self.date = date
        self.abstract = abstract
        self.imageURL = imageURL
        self.tags = tags
        self.body = body
        self.href = "blog/\(href)"
    }
    
    public init?(from url: URL, href: String) {
        guard let rawPost = try? String(contentsOfFile: url.path) else {
            return nil
        }
        
        let result = MarkdownParser().parse(rawPost)

        guard let heading = result.metadata["title"],
            let date = result.metadata["date"],
            let abstract = result.metadata["abstract"],
            let tags = result.metadata["tags"] else {
                return nil
        }
        let tempTags = tags.split(separator: ",").map { Tag(String($0)) } // todo: split strings up in tag
        self.init(
            heading,
            date: date,
            abstract: abstract,
            imageURL: result.metadata["image_url"],
            body: result.html, tempTags,
            href: href
        )
    }
}
