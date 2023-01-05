//
//  InsetTextField.swift
//  everytime_std
//
//  Created by 강보현 on 2022/03/29.
//

import Foundation
import UIKit

class InsetTextField: UITextField{
    var insetX: CGFloat = 0{
        didSet{
            
        }
    }
    
    var insetY: CGFloat = 0{
        didSet{
            layoutIfNeeded()
        }
    }
    
    //textField 영역 지정 함수
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
}
