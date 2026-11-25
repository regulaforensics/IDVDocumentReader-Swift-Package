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
            from: "4.0.2153-nightly"
        ),
        .package(
            name: "DocumentReader",
            url: "https://github.com/regulaforensics/DocumentReader-Swift-Package.git",
            from: "9.11.7428-nightly"
        ),
    ],
    targets: [
        .binaryTarget(
            name: binaryTargetName,
            url: "https://pods.regulaforensics.com/Nightly/IDVDocumentReaderNightly/4.0.4251/IDVDocumentReaderNightly-4.0.4251.zip",
            checksum: "91340502d2c62d670c283abd94882100aac6718d221ab62ee4abb7bea96a12fc"
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
