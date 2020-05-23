import Foundation

protocol Displayable {
    func render() -> String
}

protocol HTMLComponent1: Displayable {
    var openingTag: String { get set }
    var closingTag: String { get set }
}
