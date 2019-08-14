// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Swiftline",
  products: [
    .library(name: "Swiftline", targets: ["Swiftline"]),
  ],
  targets: [
    .target(name: "Swiftline", path: "Source"),
  ]
)
