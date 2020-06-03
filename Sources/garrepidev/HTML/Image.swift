import Foundation

public class Image: HTMLComponent {
    public init(url: String) {
        super.init(.img, attributes: ["src": url])
    }
}
