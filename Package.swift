// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Blackboard",
    products: [
        .executable(name: "blackboard", targets: ["Main"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.0")
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
                "Yams"
            ],
            resources: [.copy("Resources/symbols")]
        ),
        .testTarget(
            name: "BlackboardFrameworkTests",
            dependencies: ["BlackboardFramework"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
