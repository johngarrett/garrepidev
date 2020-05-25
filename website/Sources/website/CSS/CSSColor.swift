import Foundation

struct CSSColor {
    public let stringValue: String
    init(_ hexCode: String) {
        self.stringValue = hexCode
    }
    
    init(r: Int, g: Int, b: Int, a: Double = 0) {
        self.stringValue = "rgba(\(r), \(g), \(b), \(a))"
    }
}
