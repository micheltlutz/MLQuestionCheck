//
//  UIColor+Hex.swift
//  LuvPet
//
//  Created by Michel Anderson Lutz Teixeira on 06/12/17.
//  Copyright © 2017 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let hexN = hex.replacingOccurrences(of: "#", with: "", options: .literal, range: nil)
        let scanner = Scanner(string: hexN)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
