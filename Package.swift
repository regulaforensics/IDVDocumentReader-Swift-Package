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
            from: "3.10.2073-nightly"
        ),
        .package(
            name: "DocumentReader",
            url: "https://github.com/regulaforensics/DocumentReader-Swift-Package.git",
            from: "9.10.7231-nightly"
        ),
    ],
    targets: [
        .binaryTarget(
            name: binaryTargetName,
            url: "https://pods.regulaforensics.com/Nightly/IDVDocumentReaderNightly/3.10.4081/IDVDocumentReaderNightly-3.10.4081.zip",
            checksum: "0e9d177820426714ff9df60d901039ecba9f1feefbdde55be228df1f589bb78e"
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
