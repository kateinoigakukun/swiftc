// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftc",
    products: [
        .library(
            name: "swiftc",
            targets: ["swiftc"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "swiftc",
            dependencies: ["Parser"]),
        .target(
            name: "Parser",
            dependencies: ["Lexer", "AST"]),
        .target(
            name: "AST",
            dependencies: []),
        .target(
            name: "Lexer",
            dependencies: []),
        .testTarget(
            name: "swiftcTests",
            dependencies: ["swiftc"]),
        .testTarget(
            name: "ParserTests",
            dependencies: ["Parser"]),
        .testTarget(
            name: "LexerTests",
            dependencies: ["Lexer"]),
    ]
)
