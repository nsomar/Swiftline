// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Swiftline",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        .library(name: "Swiftline", targets: ["Swiftline"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "4.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "9.0.0"),
    ],
    targets: [
        .target(name: "Swiftline", path: "Sources"),
        .testTarget(name: "SwiftlineTests",
                    dependencies: [.target(name: "Swiftline"),
                                   .product(name: "Quick"),
                                   .product(name: "Nimble")],
                    path: "Tests"),
    ]
)
