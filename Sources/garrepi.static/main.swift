import Foundation

let basePath = "/home/garrepi/dev/johngarrett.github.io"
let saveLocation = URL(fileURLWithPath: basePath)
let generator = Generator(saveLocation: saveLocation)

generator.generateCommon()
print("generated common\t✓")
generator.generateBlogs(at: URL(fileURLWithPath: "/home/garrepi/documents/garrepi-blog-posts"))
print("generated blogs\t✓")
generator.generateProjects(at: URL(fileURLWithPath: "/home/garrepi/documents/garrepi-projects"))
print("generated projects\t✓")
generator.generateCssSheet()
print("generated stylesheets\t✓")
