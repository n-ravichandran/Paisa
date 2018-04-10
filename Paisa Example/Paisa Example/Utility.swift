//
//  Utility.swift
//  Paisa Example
//
//  Created by Niranjan Ravichandran on 3/21/18.
//  Copyright © 2018 Aviato. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hexCode: String) {
        let r, g, b, a: CGFloat
        
        if hexCode.hasPrefix("#") {
            let start = hexCode.index(hexCode.startIndex, offsetBy: 1)
            var hexColor = String(hexCode[start...])
            
            if hexColor.count == 6 {
                hexColor += "ff"
            }
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        self.init(white: 0, alpha: 1)
    }
}
