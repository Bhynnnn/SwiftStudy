//
//  InsertTextField.swift
//  everytime_std
//
//  Created by 강보현 on 2022/03/23.
//

import Foundation
import UIKit

class InsertTextField: UITextField{
    var insertX: CGFloat = 0{
        didSet{
            layoutIfNeeded()
        }
    }
    
    var insertY: CGFloat = 0{
        didSet{
            layoutIfNeeded()
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insertX, dy: insertY)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insertX, dy: insertY)
    }
}
