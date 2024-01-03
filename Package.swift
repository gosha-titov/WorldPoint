// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WorldPoint",
    products: [
        .library(
            name: "WorldPoint",
            targets: ["WorldPoint"]
        ),
    ],
    targets: [
        .target(
            name: "WorldPoint",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "WorldPointTests",
            dependencies: ["WorldPoint"]
        ),
    ]
)
