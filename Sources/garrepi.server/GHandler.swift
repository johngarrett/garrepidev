import Foundation
import PerfectHTTP
import PerfectLib
import garrepidev

struct GHandler {
    let base: GBase
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
        if let postName = request.path(after: "blog/") {
            base.change(to: .BlogDetail, title: postName)
        } else {
            base.change(to: .BlogOverview)
        }
        response.appendBody(string: base.render())
        response.completed()
    }
    
    func projectHandler(_ request: HTTPRequest, _ response: HTTPResponse) {
        response.setHeader(.contentType, value: "text/html")
        
        if let projectName = request.path(after: "projects/") {
            base.change(to: .ProjectDetail, title: projectName)
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
