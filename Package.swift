// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "garrepidev",
    products: [
        .library(name: "garrepidev", targets: ["garrepidev"]),
        .executable(name: "garrepidev-viewer", targets: ["garrepidev-viewer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johngarrett/HyperSwift", .branch("master")),
        .package(url: "https://github.com/johngarrett/HyperView", .branch("master")),
        .package(name: "Ink", url: "https://github.com/johnsundell/ink.git", from: "0.1.0")
    ],
    targets: [
        .target(name: "garrepidev",dependencies: ["HyperSwift", "Ink"]),
        .target(name: "garrepidev-viewer",dependencies: ["garrepidev", "HyperSwift", "Ink", "HyperView"]),
    ]
)
