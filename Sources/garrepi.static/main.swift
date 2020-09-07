import Foundation

let basePath = "/Users/garrepi/dev/johngarrett.github.io"
let saveLocation = URL(fileURLWithPath: basePath)
let generator = Generator(saveLocation: saveLocation)

generator.generateCommon()
print("generated common\t✓")
generator.generateBlogs(at: URL(fileURLWithPath: basePath + "/blog-posts"))
print("generated blogs\t✓")
generator.generateProjects(at: URL(fileURLWithPath: basePath + "/project-posts"))
print("generated projects\t✓")
generator.generateCssSheet()
print("generated stylesheets\t✓")
