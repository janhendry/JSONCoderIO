// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "JSONCoderIO",
    products: [
        .library(
            name: "JSONCoderIO",
            targets: ["JSONCoderIO"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JSONCoderIO",
            dependencies: []
            ),
        .testTarget(
            name: "JSONCoderIOTests",
            dependencies: ["JSONCoderIO"],
            resources: [ .copy("Resources/JSONTestData"), ]
            ),
    ]
)
