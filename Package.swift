// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Swiftline",
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "8.0.1")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "2.2.0"))
    ],
    targets: [
        .target(name: "Swiftline", dependencies: ["Nimble"]),
        .testTarget(name: "SwiftlineTests", dependencies: ["Swiftline", "Nimble", "Quick"])
    ]
)
