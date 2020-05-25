import Foundation

struct Generator {
    static func render(_ component: Displayable, to filename: String = "index.html") {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent("/temp/\(filename)")

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
    
    static func render(_ page: HTMLPage, with title: String) {
        let component = Root(title: title) {
            page.sidebar.render()
            HTMLComponent(.div, attributes: ["class": "g_main"]) {
                HTMLComponent(.div) {
                    page.render()
                }
            }
            .margin(left: 15, percentage: true)
            .padding(top: 5, right: 20, left: 20)
            .rawCSS("position", "absolute")
            .rawCSS("float", "left")
        }
        render(component, to: type(of: page).relativeAddress)
    }
}
