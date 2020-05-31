import Foundation

struct CSSStyleSheet {
    static var stylesheet: [String: [String]] = ["": [""]]
    static func add(_ linearKV: String, for className: String) {
        stylesheet[className] = stylesheet[className] ?? [""]
        // temporary, TODO: switch to dictionary
        if !stylesheet[className]!.contains(linearKV) {
            stylesheet[className]!.append(linearKV)
        }
    }
    
    static func add(_ linearKV: String, for tag: HTMLTag, parent parentClass: String) {
        add(linearKV, for: "\(parentClass) \(tag.rawValue)")
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
