// swift-tools-version:5.3
import PackageDescription

let packageName = "IDVDocumentReader"

let package = Package(
    name: packageName,
    platforms: [.iOS(.v14)],
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
            .exact(Version(stringLiteral: "3.1.1203"))
        ),
        .package(
            name: "DocumentReader",
            url: "https://github.com/regulaforensics/DocumentReader-Swift-Package.git",
            .exact(Version(stringLiteral: "8.2.5052"))
        ),
    ],
    targets: [
        .binaryTarget(
            name: packageName,
            url: "https://pods.regulaforensics.com/\(packageName)/3.1.1732/\(packageName)-3.1.1732.zip",
            checksum: "12f1213a860f15f5af88522b107606178c6f7490a4921efbaaa136e6c776e85a"
        ),
        .target(
            name: "\(packageName)Common",
            dependencies: [
                .target(name: packageName),
                .product(name: "IDVModule", package: "IDVModule"),
                .product(name: "DocumentReader", package: "DocumentReader")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ]
)
