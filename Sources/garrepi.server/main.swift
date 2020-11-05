import PerfectHTTP
import PerfectHTTPServer
import garrepidev
import Foundation

func blogs(from folder: URL) -> [Post]? {
    guard let blogFiles = try? FileManager.default.contentsOfDirectory(atPath: folder.path) else {
        print("[CRITICAL] could not generate blogs from \(folder.path)")
        return nil
    }
    return blogFiles.compactMap {
        Post(
            from: folder.appendingPathComponent($0),
            href: $0.replacingOccurrences(of: ".md", with: "")
        )
    }
}
func projects(from folder: URL) -> [Project]? {
    guard let projectFiles = try? FileManager.default.contentsOfDirectory(atPath: folder.path) else {
        print("[CRITICAL] could not generate projects from \(folder.path)")
        return nil
    }
    return projectFiles.compactMap { 
        Project(
            from: folder.appendingPathComponent($0),
            href: $0.replacingOccurrences(of: ".md", with: "")
        )
    }
}

var routes = Routes()

let stylesheets = [
    "<link rel=\"stylesheet\" href=\"/styles.css\" type=\"text/css\">"
]

let head = Head(title: "garreπ", stylesheets: stylesheets)
let blogOverview = BlogOverview(blogs(from: URL(fileURLWithPath: "/Users/garrepi/documents/garrepi-blog-posts")))
let projectsOverview = ProjectsOverview(projects(from: URL(fileURLWithPath: "/Users/garrepi/documents/garrepi-projects")))

let gHandler = GHandler(head, About(), blogOverview, projectsOverview)

routes.add(method: .get, uri: "/styles.css", handler: gHandler.cssHandler)
routes.add(method: .get, uri: "/about/*", handler: gHandler.aboutHandler)
routes.add(method: .get, uri: "/blog/*", handler: gHandler.blogHandler)
routes.add(method: .get, uri: "/projects/*", handler: gHandler.projectHandler)
routes.add(method: .get, uri: "/images/*", handler: gHandler.imgHandler)
routes.add(method: .get, uri: "/*", handler: gHandler.generalHandler)

try HTTPServer.launch(
    name: "localhost",
    port: 8181,
    routes: routes,
    responseFilters: [
        (PerfectHTTPServer.HTTPFilter.contentCompression(data: [:]), HTTPFilterPriority.high)
    ]
)
