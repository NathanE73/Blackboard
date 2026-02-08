// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Blackboard",
    products: [
        .executable(name: "blackboard", targets: ["Main"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.6.2"),
        .package(url: "https://github.com/jpsim/Yams", from: "6.2.0"),
    ],
    targets: [
        .target(
            name: "Main",
            dependencies: ["BlackboardFramework"]
        ),
        .target(
            name: "BlackboardFramework",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Yams",
            ]
        ),
        .testTarget(
            name: "BlackboardFrameworkTests",
            dependencies: ["BlackboardFramework"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
