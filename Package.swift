// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftKeychain",
    platforms: [.macOS(.v10_15), .iOS(.v13), .watchOS(.v6), .tvOS(.v13)],
    products: [
        .library(
            name: "SwiftKeychain",
            targets: ["SwiftKeychain"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "SwiftKeychain"),
        .testTarget(
            name: "SwiftKeychainTests",
            dependencies: ["SwiftKeychain"]),
    ]
)
