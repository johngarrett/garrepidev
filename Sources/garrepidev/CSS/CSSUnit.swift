import Foundation

public struct CSSUnit: CustomStringConvertible {
    public enum UnitType: String {
        case percentage = "%"
        case em
        case px
        case rem
    }
    static public var zero = CSSUnit(0, .px)
    public let description: String
    public init(_ unit: Double, _ type: UnitType = .px) {
        self.description = "\(unit)\(type.rawValue)"
    }
}
