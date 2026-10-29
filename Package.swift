// swift-tools-version:5.5
import PackageDescription

let packageName = "IDVDocumentReader"
let binaryTargetName = "IDVDocumentReader"

let package = Package(
    name: packageName,
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: packageName,
            targets: ["\(packageName)Common"]
        ),
    ],
    dependencies: [
        .package(
            name: "IDVModule",
            url: "https://github.com/regulaforensics/IDVModule-Swift-Package.git",
            from: "3.10.2099"
        ),
        .package(
            name: "DocumentReader",
            url: "https://github.com/regulaforensics/DocumentReader-Swift-Package.git",
            from: "9.9.7126"
        ),
    ],
    targets: [
        .binaryTarget(
            name: binaryTargetName,
            url: "https://pods.regulaforensics.com/IDVDocumentReader/3.10.4102/IDVDocumentReader-3.10.4102.zip",
            checksum: "6f951e809a11444fe14b4e349bd35047fef8bb90b5400566955018f9bb3ed8af"
        ),
        .target(
            name: "\(packageName)Common",
            dependencies: [
                .target(name: binaryTargetName),
                .product(name: "IDVModule", package: "IDVModule"),
                .product(name: "DocumentReader", package: "DocumentReader")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ]
)
