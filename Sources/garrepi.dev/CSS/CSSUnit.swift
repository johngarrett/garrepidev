import Foundation

struct CSSUnit: CustomStringConvertible {
    enum UnitType: String {
        case percentage = "%"
        case em
        case px
        case rem
    }
    static var zero = CSSUnit(0, .px)
    let description: String
    init(_ unit: Double, _ type: UnitType = .px) {
        self.description = "\(unit)\(type.rawValue)"
    }
}