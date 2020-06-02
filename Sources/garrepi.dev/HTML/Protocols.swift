import Foundation

protocol Displayable {
    func render() -> String
}

protocol ComponentType {
    func render() -> HTMLComponent
}

protocol HTMLPage: ComponentType {
    var sidebar: ComponentType { get set }
    static var relativeAddress: String { get set }
}
