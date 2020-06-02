import Foundation

struct CSSColor: CustomStringConvertible {
    let description: String
    init(_ hexCode: String) {
        self.description = hexCode
    }
    
    init(r: Int, g: Int, b: Int, a: Double = 0) {
        self.description = "rgba(\(r), \(g), \(b), \(a))"
    }
}
