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
        .package(url: "https://github.com/johngarrett/HyperSwift", .branch("master"))
    ],
    targets: [
        .target(
            name: "garrepidev",
            dependencies: ["HyperSwift"]),
    ]
)
