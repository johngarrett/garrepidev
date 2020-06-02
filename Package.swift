// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "garrepi.dev",
    products: [
        .library(
            name: "garrepi.dev",
            targets: ["garrepi.dev"]
        )
    ],
    dependencies: [
        .package(name: "Ink", url: "https://github.com/johnsundell/ink.git", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "garrepi.dev",
            dependencies: ["Ink"]),
        .testTarget(
            name: "websiteTests",
            dependencies: ["garrepi.dev"]),
    ]
)
