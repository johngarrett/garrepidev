import Foundation

public protocol Displayable {
    func render() -> String
}

public protocol ComponentType {
    func render() -> HTMLComponent
}

public protocol HTMLPage: ComponentType {
    var sidebar: ComponentType { get set }
    static var absoluteAddress: String { get set }
}
