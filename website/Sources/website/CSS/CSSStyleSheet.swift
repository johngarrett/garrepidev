import Foundation

struct CSSStyleSheet {
    static var stylesheet: [String: [String]] = ["": [""]]
    static func add(_ linearKV: String, for className: String) {
        if stylesheet[className] != nil {
            stylesheet[className]!.append(linearKV)
        } else {
            stylesheet[className] = [linearKV]
        }
    }
    
    static func generateStyleSheet() -> String {
        var output = ""
        for (className, styles) in stylesheet {
            if className == "" {
                continue
            }
            output.append(".\(className) {\n\t")
            output.append(
                "\(styles.joined(separator: "\n\t"))"
            )
            output.append("\n}\n")
        }
        
        return output
    }
}
