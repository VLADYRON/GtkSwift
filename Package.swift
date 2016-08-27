//
//  Copyright © 2016 Tim Diekmann. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "GtkSwift",
    dependencies: [
        .Package(url: "../CGtk", majorVersion: 0)
    ]
)
