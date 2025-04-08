// swift-tools-version:5.3
import PackageDescription

let packageName = "IDVDocumentReader"

let package = Package(
    name: "IDVDocumentReader",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "IDVDocumentReader",
            targets: ["\(packageName)Common"]),
    ],
    dependencies: [
        .package(name: "IDVModule", url: "https://github.com/regulaforensics/IDVModule-Swift-Package.git", .exact(Version(stringLiteral: "0.1.118"))),
        .package(name: "DocumentReader", url: "https://github.com/regulaforensics/DocumentReader-Swift-Package.git", .exact(Version(stringLiteral: "7.6.4456"))),
    ],
    targets: [
        .binaryTarget(name: "IDVDocumentReader", url: "https://pods.regulaforensics.com/IDVDocumentReader/2.3.339/IDVDocumentReader-2.3.339.zip", checksum: "329e45f153432cd7dec7643434f654a476d3d0da2e474b35b62ec4439973bb77"),
        .target(
            name: "\(packageName)Common",
            dependencies: [
                .target(name: "IDVDocumentReader"),
                .product(name: "IDVModule", package: "IDVModule"),
                .product(name: "DocumentReader", package: "DocumentReader")
            ],
            path: "Sources",
            sources: ["dummy.swift"]
        )
    ]
)
