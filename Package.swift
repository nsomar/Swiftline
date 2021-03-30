// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Swiftline",
    products: [
            .library(
                name: "Swiftline",
                targets: ["Swiftline"])
        ],
        targets: [
            .target(
                name: "Swiftline",
                swiftSettings: [
                    .define("DEBUG", .when(configuration: .debug)),
                ]),
            .testTarget(
                name: "SwiftlineTests",
                dependencies: ["Swiftline"]),
            .testTarget(
                name: "GeneralTests",
                dependencies: ["Swiftline"]),
        ],
        swiftLanguageVersions: [.v4_2, .v5]
)
