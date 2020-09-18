import Foundation
import garrepidev
import HyperSwift

struct Generator {
    public let saveLocation: URL
    public let sidebar = Sidebar()
    
    func generateCssSheet() {
        var stylesheet = CSSStyleSheet.generateStyleSheet()
        stylesheet +=
        """
        @font-face {
            font-family: "SF Mono";
            src: url("/../fonts/SFMono-Regular.otf") format('opentype');
            font-weight: normal;
        }
        @font-face {
            font-family: "SF Mono";
            src: url("/../fonts/SFMono-Bold.otf") format('opentype');
            font-weight: bold;
        }
        @font-face {
            font-family: "CrimsonText";
            src: url("/../fonts/CrimsonText-Regular.ttf") format('truetype');
            font-weight: normal;
        }
        @font-face {
            font-family: "CrimsonText";
            src: url("/../fonts/CrimsonText-Blog.ttf") format('truetype');
            font-weight: bold;
        }
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
        g_blog_detail {
            img {
                max-width: 500px;
                width: 80%;
            }
        }
        """
        do {
            try stylesheet.write(
                to: saveLocation.appendingPathComponent("css/styles.css"),
                atomically: true,
                encoding: String.Encoding.utf8
            )
        } catch {
            print("[CRITICAL] could not save stylesheet: ", error.localizedDescription)
        }
    }
    
    /**
     Generate top level, common pages.
        - About, 404, 500, etc.
     */
    func generateCommon() {
        savePage(About())
        savePage(FourOFour())
        savePage(FiveHundred())
    }
    
    func generateBlogs(at folder: URL) {
        guard let blogFiles = try? FileManager.default.contentsOfDirectory(atPath: folder.path) else {
            print("[CRITICAL] could not generate blogs from \(folder.path)")
            return
        }
        let posts = blogFiles.compactMap {
            Post(from: folder.appendingPathComponent($0), href: $0.replacingOccurrences(of: ".md", with: ""))
        }
        let overviewPage = BlogOverview(posts)
        
        savePage(overviewPage)
        overviewPage.blogDetailPages.forEach { savePage($0) }
    }
    
    func generateProjects(at folder: URL) {
        guard let projectFiles = try? FileManager.default.contentsOfDirectory(atPath: folder.path) else {
            print("[CRITICAL] could not generate projects from \(folder.path)")
            return
        }
        let projects = projectFiles.compactMap {
            Project(from: folder.appendingPathComponent($0), href: $0.replacingOccurrences(of: ".md", with: ""))
        }
        let overviewPage = ProjectsOverview(projects)
        
        savePage(overviewPage)
        overviewPage.projectDetailPages.forEach { savePage($0) }
    }
    
    private func savePage(_ page: HTMLPage) {
        let head = Head(
            title: page.title,
            stylesheets: [
                "<link rel=\"stylesheet\" href=\"/css/styles.css\">"
            ]
        )
        let htmlOutput = Root(head, [page.render()]).render()
        
        do {
            try htmlOutput.write(
                to: saveLocation.appendingPathComponent(page.href + ".html"),
                atomically: true,
                encoding: String.Encoding.utf8
            )
            print("saved page \(page.href)\t✓")
        } catch let error as NSError {
            print("[CRITICAL] could not save htmlOutput: ", error.localizedDescription)
        }
    }
}
