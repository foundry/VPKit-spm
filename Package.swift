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
            url: "git@gitlab.com/foundry/dotveep-spm.git",
            from: "2.0.0")
    ],
    targets: [
        .target (
            name: "VPKit-static-target",
            dependencies: [
                .target(name: "VPKit-static-wrapper",
                        condition: .when(platforms: [.iOS])
                       )],
            path: "VPKit-static-target"
            
        ),
        .target (
            name: "VPKit-static-wrapper",
            dependencies: [
                .target(name: "VPKit-static-binary",
                        condition: .when(platforms: [.iOS])),
//                .target(name: "dotveep-static-binary",
//                        condition: .when(platforms: [.iOS])),
                .product(
                    name: "AWSCore",
                    package: "aws-sdk-ios-spm"),
                .product(
                    name: "AWSKinesis",
                    package: "aws-sdk-ios-spm"),
                .product(name: "dotveep-static",
                         package: "dotveep-spm")
                
            ],
            path: "VPKit-static-wrapper"
        ),
        

            .target (
                name: "VPKit-dynamic-target",
                dependencies: [
                    .target(name: "VPKit-dynamic-wrapper",
                            condition: .when(platforms: [.iOS])
                           )],
                path: "VPKit-dynamic-target"
            ),
        
        .target (
            name: "VPKit-dynamic-wrapper",
            dependencies: [
                .target(name: "VPKit-dynamic-binary",
                        condition: .when(platforms: [.iOS])),
//                .target(name: "dotveep-dynamic-binary",
//                        condition: .when(platforms: [.iOS])),
                .product(
                    name: "AWSCore",
                    package: "aws-sdk-ios-spm"),
                .product(
                    name: "AWSKinesis",
                    package: "aws-sdk-ios-spm"),
                .product(name: "dotveep-dynamic",
                         package: "dotveep-spm")
            ],
            path: "VPKit-dynamic-wrapper"
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
//        ,
        
//
//        .binaryTarget(
//                name: "dotveep-static-binary",
//                url: "https://gitlab.com/foundry/dotveep/-/raw/2.0.1/xcframeworks/dotveep-static/dotveep.xcframework.zip",
//                checksum: "210da9aa6378c805807da4d42c7c7aba46761b755b7aa44fc2155340a25bb2b2"),
//
//        .binaryTarget(
//            name: "dotveep-dynamic-binary",
//            url: "https://gitlab.com/foundry/dotveep/-/raw/2.0.1/xcframeworks/dotveep-dynamic/dotveep.xcframework.zip",
//            checksum: "865b74e0f931e9027203e4a29bdbbb9d486efb0ab3425b9fd63fc39d32fee637")
        
        
    ]
)
