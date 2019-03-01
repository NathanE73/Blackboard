// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Blackboard",
    products: [
        .executable(name: "blackboard", targets: ["Main"]),
        ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: ["Blackboard"]),
        .target(
            name: "Blackboard",
            dependencies: []),
        .testTarget(
            name: "BlackboardTests",
            dependencies: ["Blackboard"]),
        ]
)
