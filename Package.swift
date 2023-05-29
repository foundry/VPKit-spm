    // swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//2.10.0-beta.1

let package = Package(
    name: "VPKit xcfamework",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VPKit-static",
            targets: ["VPKit-static"]),
        .library(
            name: "VPKit-dynamic",
            targets: ["VPKit-dynamic"]),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
//        .binaryTarget(name:"VPKit", path:"../VPKit2/xcframeworks/VPKit-static/VPKit.xcframework" ),
        .binaryTarget(
            name: "VPKit-static",
            url: "https://gitlab.com/foundry/VPKit/-/raw/2.10.0/xcframeworks/VPKit-static/VPKit.xcframework.zip",
            checksum: "c5e8ab406126abf7340d5f02fc7b1cda60a14d53bef894f053501be84460198d"),
        .binaryTarget(
            name: "VPKit-dynamic",
            url: "https://gitlab.com/foundry/VPKit/-/raw/2.10.0/xcframeworks/VPKit-dynamic/VPKit.xcframework.zip",
            checksum: "37c9e2b3bdb53191290c528a89b5594bcba0650dc26eebd6b0eb0e0bb10722d0")
        
    ]
)
