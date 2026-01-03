// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZPack",
    platforms: [
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "ZPack",
            targets: ["ZPack"]
        ),
    ],
    targets: [
        .target(
            name: "ZPack",
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"])
            ]
        ),

    ]
)

