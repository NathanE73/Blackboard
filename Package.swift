// swift-tools-version:5.3

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
            dependencies: ["BlackboardFramework"]
        ),
        .target(
            name: "BlackboardFramework",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "BlackboardFrameworkTests",
            dependencies: ["BlackboardFramework"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
