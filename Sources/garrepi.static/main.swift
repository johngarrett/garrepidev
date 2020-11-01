import Foundation

let basePath = "/Users/garrepi/dev/johngarrett.github.io"
let saveLocation = URL(fileURLWithPath: basePath)
let generator = Generator(saveLocation: saveLocation)

generator.generateCommon()
print("generated common\t✓")
generator.generateBlogs(at: URL(fileURLWithPath: "/Users/garrepi/documents/garrepi-blog-posts"))
print("generated blogs\t✓")
generator.generateProjects(at: URL(fileURLWithPath: "/Users/garrepi/documents/garrepi-projects"))
print("generated projects\t✓")
generator.generateCssSheet()
print("generated stylesheets\t✓")
