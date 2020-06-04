import Foundation

public struct Generator {
    public static func render(_ component: Displayable, to filename: String = "index.html") {
        renderStyleSheet()
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent("/temp/\(filename).html")

            do {
                try component.render().write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {
                print("Could not write to index.html")
            }
        } else {
            print("Could not get directory")
        }
    }
    
    static public func render(_ page: HTMLPage, with title: String) {
        renderStyleSheet()
        let component = Root(title: title) {
            page.sidebar.render()
            HTMLComponent(.div, attributes: ["class": "g_main"]) {
                HTMLComponent(.div) {
                    page.render()
                }
            }
            .margin(left: 15, .percentage)
            .padding(top: 5, right: 20, left: 20)
            .rawCSS("position", "absolute")
            .rawCSS("float", "left")
        }
        render(component, to: type(of: page).absoluteAddress)
    }
    
    static private func renderStyleSheet(to filename: String = "styles2.css") {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("/temp/\(filename)")
            do {
                try CSSStyleSheet.generateStyleSheet().write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {
                print("Could not write to \(filename)")
            }
        } else {
            print("Could not get directory")
        }
    }
    
}
