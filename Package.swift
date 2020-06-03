// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "garrepidev",
    products: [
        .library(
            name: "garrepidev",
            targets: ["garrepidev"]
        ),
    ],
    dependencies: [
        .package(name: "Ink", url: "https://github.com/johnsundell/ink.git", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "garrepidev",
            dependencies: ["Ink"]),
    ]
)
