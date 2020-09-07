// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "garrepidev",
    products: [
        .library(name: "garrepidev", targets: ["garrepidev"]),
        .executable(name: "garrepi.server", targets: ["garrepi.server"]),
        .executable(name: "garrepi.static", targets: ["garrepi.static"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johngarrett/HyperSwift", .branch("master")),
        .package(name: "Ink", url: "https://github.com/johnsundell/ink.git", from: "0.1.0"),
        .package(name: "PerfectHTTPServer", url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "garrepidev",dependencies: ["HyperSwift", "Ink"]),
        .target(name: "garrepi.server",dependencies: ["garrepidev", "PerfectHTTPServer"]),
        .target(name: "garrepi.static",dependencies: ["garrepidev"])
    ]
)
