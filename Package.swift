// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-discovery",
    platforms: [.macOS(.v26)],
    dependencies: [
        .package(url: "https://git.aparoksha.dev/aparoksha/adwaita-swift", branch: "main"),
        .package(url: "https://github.com/fwcd/swift-dns-service-discovery", branch: "linux"),
    ],
    targets: [
        .target(
            name: "DiscoveryCore",
            dependencies: [
                .product(name: "DNSServiceDiscovery", package: "swift-dns-service-discovery")
            ]),
        .executableTarget(
            name: "Discovery",
            dependencies: [
                "DiscoveryCore",
                .product(name: "Adwaita", package: "adwaita-swift"),
                .product(name: "DNSServiceDiscovery", package: "swift-dns-service-discovery"),
            ]
        ),
    ]
)

// brew install gtk4 libxml2 atk glib glib-networking gobject-introspection pkgcon libadwaita
// dnf install swiftlang libadwaita-devel pkg-config avahi-compat-libdns_sd-devel
