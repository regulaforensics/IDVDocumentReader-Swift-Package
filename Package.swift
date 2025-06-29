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
        .package(name: "IDVModule", url: "https://github.com/regulaforensics/IDVModule-Swift-Package.git", .exact(Version(stringLiteral: "2.5.539"))),
        .package(name: "DocumentReader", url: "https://github.com/regulaforensics/DocumentReader-Swift-Package.git", .exact(Version(stringLiteral: "8.1.4772"))),
    ],
    targets: [
        .binaryTarget(name: "IDVDocumentReader", url: "https://pods.regulaforensics.com/IDVDocumentReader/2.5.779/IDVDocumentReader-2.5.779.zip", checksum: "3dcd16b8246f7121163d60412f8f65e132ddb740741c8b9c836f084545fcd994"),
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
