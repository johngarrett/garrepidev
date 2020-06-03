import Foundation

class Image: HTMLComponent {
    init(url: String) {
        super.init(.img, attributes: ["src": url])
    }
}
