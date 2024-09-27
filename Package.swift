// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-discovery",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(url: "https://github.com/AparokshaUI/adwaita-swift", from: "0.2.6"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "swift-discovery",
            dependencies: [
                .product(name: "Adwaita", package: "adwaita-swift"),
                .product(name: "CAdw", package: "adwaita-swift"),
            ]
        ),
        .testTarget(
            name: "swift-discoveryTests",
            dependencies: ["swift-discovery"]
        )
    ],
    swiftLanguageVersions: [SwiftVersion.v5]
)
