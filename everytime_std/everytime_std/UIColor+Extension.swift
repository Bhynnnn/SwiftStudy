//
//  UIColor+Extension.swift
//  everytime_std
//
//  Created by 강보현 on 2022/03/23.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(r: Int, g: Int, b:Int, a:Int) {
        self.init(red: CGFloat(r)/225, green: CGFloat(g)/225, blue: CGFloat(b)/225, alpha: CGFloat(a)/225)
    }
    
    convenience init(r: Int, g: Int, b:Int) {
        self.init(red: CGFloat(r)/225, green: CGFloat(g)/225, blue: CGFloat(b)/225, alpha: 1)
    }
    
    convenience init(w: Int) {
        self.init(white: CGFloat(w)/225, alpha: 1)
    }
}
