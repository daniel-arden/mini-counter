// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "BuildTools",
    dependencies: [
        // Build Tools
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.41.2"),
        .package(url: "https://github.com/realm/SwiftLint", from: "0.45.0"),
    ],
    targets: [.target(name: "BuildTools", path: "")]
)
