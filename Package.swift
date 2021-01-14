// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Blackboard",
    products: [
        .executable(name: "blackboard", targets: ["Main"]),
        ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: ["Blackboard"]),
        .target(
            name: "Blackboard",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "BlackboardTests",
            dependencies: ["Blackboard"]),
        ]
)
