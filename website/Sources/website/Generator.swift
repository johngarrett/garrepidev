import Foundation

struct Generator {
    static func render(component: Displayable) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent("/temp/index.html")

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
}
