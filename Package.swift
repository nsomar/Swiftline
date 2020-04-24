// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Swiftline",
  platforms: [
      .macOS(.v10_13),
  ],
  products: [
    .library(name: "Swiftline", targets: ["Swiftline"]),
  ],
  targets: [
    .target(name: "Swiftline"),
  ]
)
