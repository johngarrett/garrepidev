import Foundation
import PerfectHTTP
import PerfectLib
import garrepidev
import HyperSwift

struct GHandler {
    let base: GBase

    func cssHandler(request: HTTPRequest, response: HTTPResponse) {
        response.setHeader(.contentType, value: "text/css")
        response.appendBody(string: StyleSheet.generateStyleSheet())
        response.appendBody(string: """
            body {
                font-family: "SF Mono";
            }

            .g_sidebar a:hover {
                text-decoration: underline;
            }
            .g_project_card:hover {
                position: relative;
                top: -5px;
                left: -5px;
                box-shadow: 25px 35px 0px 0px rgba(0, 0, 0, 0.6);
            }
            pre {
                overflow: scroll;
            }
        """)
        response.completed()
    }
    func generalHandler(_ request: HTTPRequest, _ response: HTTPResponse) {
        response.setHeader(.contentType, value: "text/html")
        base.change(to: request.path == "/" ? .About : .FourOFour) 
        response.appendBody(string: base.render())
        response.completed()
    }
    
    func aboutHandler(_ request: HTTPRequest, _ response: HTTPResponse) {
        response.setHeader(.contentType, value: "text/html")
        base.change(to: .About)
        response.appendBody(string: base.render())
        response.completed()
    }
    
    func blogHandler(_ request: HTTPRequest, _ response: HTTPResponse) {
        response.setHeader(.contentType, value: "text/html")
        if let href = request.path(after: "blog/") {
            base.change(to: .BlogDetail, at: "blog/\(href)")
        } else {
            base.change(to: .BlogOverview)
        }
        response.appendBody(string: base.render())
        response.completed()
    }
    
    func projectHandler(_ request: HTTPRequest, _ response: HTTPResponse) {
        response.setHeader(.contentType, value: "text/html")
        
        if let href = request.path(after: "projects/") {
            base.change(to: .ProjectDetail, at: "projects/\(href)")
        } else {
            base.change(to: .ProjectsOverview)
        }
        response.appendBody(string: base.render())
        response.completed()
    }
    
    func imgHandler(_ request: HTTPRequest, _ response: HTTPResponse) {
        guard let imageName = request.path(after: "images/"),
            let imageType = imageName.split(separator: ".").last else {
            response.setHeader(.contentType, value: "text/html")
            response.appendBody(string: "this image doesn't exist!")
            response.completed()
            return
        }
        
        response.setHeader(.contentType, value: "image/\(imageType)")
        let thisFile = File("~/dev/g-server/Sources/g-server/images/\(imageName)")
        if let bytes = try? thisFile.readSomeBytes(count: thisFile.size) {
            response.appendBody(bytes: bytes)
        } else {
            response.setHeader(.contentType, value: "text/html")
            response.appendBody(string: "this image doesn't exist!")
        }
        response.completed()
    }
    
    init(
        _ head: Head,
        _ about: About,
        _ blogs: BlogOverview,
        _ projects: ProjectsOverview
    ) {
        self.base = GBase(head, about, blogs, projects)
    }
}

extension HTTPRequest {
    func path(after text: String) -> String? {
        let components = self.path.components(separatedBy: "\(text)")
        return components.count > 1 ? components.last : nil
    }
}
