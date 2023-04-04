// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOStyleLibrary",
    products: [
        .library(
            name: "iOStyleLibrary",
            targets: ["iOStyleLibrary"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "iOStyleLibrary",
            dependencies: [],
            path: "Source"),
    ]
)
