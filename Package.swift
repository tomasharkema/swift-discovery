// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-discovery",
    platforms: [.macOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/makoni/swift-adwaita", branch: "main"),
        .package(url: "https://github.com/fwcd/swift-dns-service-discovery", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "Discovery",
            dependencies: [
                .product(name: "Adwaita", package: "swift-adwaita"),
               .product(name: "DNSServiceDiscovery", package: "swift-dns-service-discovery"),
            ]
        ),
    ]
)

// brew install gtk4 libxml2 atk glib glib-networking gobject-introspection pkg-config libadwaita
// dnf install swiftlang libadwaita-devel pkg-config avahi-compat-libdns_sd-devel
