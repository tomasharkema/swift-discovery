// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-discovery",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/AparokshaUI/adwaita-swift", from: "0.2.6"),
        .package(url: "https://github.com/fwcd/swift-dns-service-discovery", branch: "main"),
//        .package(url: "https://github.com/AparokshaUI/Localized", from: "0.2.0"),
        // .package(url: "https://github.com/rhx/gir2swift", branch: "main"),
        // .package(url: "https://github.com/rhx/SwiftGtk",  branch: "gtk4"),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "swift-discovery",
            dependencies: [
                .product(name: "Adwaita", package: "adwaita-swift"),
                .product(name: "DNSServiceDiscovery", package: "swift-dns-service-discovery")
//                .product(name: "Localized", package: "Localized"),
                // .product(name: "Gtk", package: "SwiftGtk"),
            ]
        ),
        .testTarget(
            name: "swift-discoveryTests",
            dependencies: ["swift-discovery"]
        )
    ]
)

// brew install gtk4 libxml2 atk glib glib-networking gobject-introspection pkg-config libadwaita
