import Foundation

public struct Post {
    public let title: String
    public let abstract: String
    public lazy var body: String = {
        "heyy"
    }()
    public let imageURL: String?
    public let tags: [Tag]
    
    public init(_ title: String, abstract: String, imageURL: String? = nil, _ tags: Tag...) {
        self.title = title
        self.abstract = abstract
        self.imageURL = imageURL
        self.tags = tags
    }
}
