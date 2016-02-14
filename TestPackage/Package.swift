import PackageDescription

let package = Package(name: "TestPackage",
  dependencies: [
    .Package(url: "../", majorVersion: 0, minor: 3),
  ]
)
