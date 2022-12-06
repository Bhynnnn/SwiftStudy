//
//  ViewController.swift
//  Calculator
//
//  Created by 강보현 on 2022/11/18.
//

import UIKit

class ViewController: UIViewController {
    // ViewController 은 UIViewController을 상속 받음
    // 모든 MVC의 Controller는 UIViewController를 상속받아야함
    
    @IBOutlet private weak var display: UILabel!

    private var userIsInTheMiddleOfTyping = false

    private var brain = CalculatorBrain()
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.reuslt
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
//        print("touched \(digit) digit")
        if userIsInTheMiddleOfTyping{
            let textCurrentlyDisplay = display.text!
            display.text = textCurrentlyDisplay + digit
        }
        else{
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
}
