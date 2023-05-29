// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//2.10.0-beta.6

let package = Package(
    name: "VPKit xcfamework",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VPKit-static",
            targets: ["VPKit-static-target"]),
        .library(
            name: "VPKit-dynamic",
            targets: ["VPKit-dynamic-target"]),
        
    ],
    dependencies: [
        .package(
            url: "https://github.com/aws-amplify/aws-sdk-ios-spm",
            from: "2.0.0"),
        .package(
            url: "https://gitlab.com/foundry/dotveep-spm",
            from: "2.0.0")
    ],
    targets: [
        .target (
            name: "VPKit-static-target",
            dependencies: [
                .target(name: "VPKit-static-binary",
                        condition: .when(platforms: [.iOS])
                       ),
                .target(name: "AWS-wrapper",
                        condition: .when(platforms: [.iOS])
                       ),
                .product(name: "dotveep-static",
                         package: "dotveep-spm")
            ],
            path: "VPKit-static-target"
        ),
        
            .target (
                name: "VPKit-dynamic-target",
                dependencies: [
                    .target(name: "VPKit-dynamic-binary",
                            condition: .when(platforms: [.iOS])
                           ),
                    .target(name: "AWS-wrapper",
                            condition: .when(platforms: [.iOS])
                           ),
                    .product(name: "dotveep-dynamic",
                             package: "dotveep-spm")
                ],
                path: "VPKit-dynamic-target"
            ),
        
            .target (name: "AWS-wrapper",
                     dependencies: [
                        .product(
                            name: "AWSCore",
                            package: "aws-sdk-ios-spm"),
                        .product(
                            name: "AWSKinesis",
                            package: "aws-sdk-ios-spm")
                     ],
                     path: "AWS-wrapper"
                    ),
        
            .binaryTarget(
                name: "VPKit-static-binary",
                url: "https://gitlab.com/foundry/VPKit/-/raw/2.10.0/xcframeworks/VPKit-static/VPKit.xcframework.zip",
                checksum: "c5e8ab406126abf7340d5f02fc7b1cda60a14d53bef894f053501be84460198d"
            ),
        
        
            .binaryTarget(
                name: "VPKit-dynamic-binary",
                url: "https://gitlab.com/foundry/VPKit/-/raw/2.10.0/xcframeworks/VPKit-dynamic/VPKit.xcframework.zip",
                checksum: "37c9e2b3bdb53191290c528a89b5594bcba0650dc26eebd6b0eb0e0bb10722d0")
              
    ]
)
