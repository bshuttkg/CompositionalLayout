// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let name = "CompositionalLayoutBuilder"
let package = Package(
  name: name,
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: name,
      targets: [name]
    )
  ],
  targets: [
    .target(
      name: name,
      path: "Sources"
    )
  ]
)
