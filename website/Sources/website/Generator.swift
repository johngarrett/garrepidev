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
                page.render()
            }
        }
        render(component, to: type(of: page).relativeAddress)
    }
}
