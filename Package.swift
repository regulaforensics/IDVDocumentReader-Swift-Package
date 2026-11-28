// swift-tools-version:5.5
import PackageDescription

let packageName = "IDVDocumentReader"
let binaryTargetName = "IDVDocumentReaderNightly"

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
            from: "4.0.2157-nightly"
        ),
        .package(
            name: "DocumentReader",
            url: "https://github.com/regulaforensics/DocumentReader-Swift-Package.git",
            from: "9.11.7454-nightly"
        ),
    ],
    targets: [
        .binaryTarget(
            name: binaryTargetName,
            url: "https://pods.regulaforensics.com/Nightly/IDVDocumentReaderNightly/4.0.4267/IDVDocumentReaderNightly-4.0.4267.zip",
            checksum: "82db2cf8254a0f438ad5795688c336cd288113b94d7bcfa3cac7f4746c971e08"
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
