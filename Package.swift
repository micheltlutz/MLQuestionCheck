// swift-tools-version:4.1
//
//  MLQuestionCheck.swift
//  MLQuestionCheck
//
//  Created by Michel Anderson Lutz Teixeira on 23/10/15.
//  Copyright © 2017 micheltlutz. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "MLQuestionCheck",
    products: [
        .library(
            name: "MLQuestionCheck",
            targets: ["MLQuestionCheck"]),
        ],
    dependencies: [],
    targets: [
        .target(
            name: "MLQuestionCheck",
            dependencies: ["UIKit"],
            path: "Sources"),
        .testTarget(
            name: "MLQuestionCheckTests",
            dependencies: ["MLQuestionCheck"],
            path: "Tests")
    ]
)
