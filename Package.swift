// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Animations",
    platforms: [.iOS(.v10), .tvOS(.v10)],
    products: [
        .library(
            name: "Animations",
            targets: ["Animations"]),
    ],
    targets: [
        .target(
            name: "Animations",
            dependencies: []),
        .testTarget(
            name: "AnimationsTests",
            dependencies: [ "Animations" ]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
