//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 강보현 on 2022/12/06.
//

// Model
import Foundation

func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}
class CalculatorBrain {
    private var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    // generic type
    // key and value
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(Double.pi), //Double.pi
        "e" : Operation.Constant(M_E), //M_E,
        "√" : Operation.UnaryOperation(sqrt), //sqrt,
        "cos" : Operation.UnaryOperation(cos), //cos
        "×" : Operation.BinaryOpeeration({ $0 * $1 }),
        "+" : Operation.BinaryOpeeration({ $0 + $1 }),
        "−" : Operation.BinaryOpeeration({ $0 - $1 }),
        "÷" : Operation.BinaryOpeeration({ $0 / $1 }),
        "=" : Operation.Equals
        
    ]
    
    private enum Operation {
        // 구별되는 값을 가지고 있음
        // method 가질 수 있음
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOpeeration((Double, Double) -> Double)
        case Equals
    }
    
    func performOperation(symbol: String) {
        //        if let constant = operations[symbol] {
        //            accumulator = constant
        //        }
        //        // Value of optional type 'Double?' must be unwrapped to a value of type 'Double' 에러
        //        // constant = operations[symbol]
        //        // accumulator = constant
        //        // 왜 에러? --> constant 의 값을 추출하길 바람
        //        // ! 붙여서 강제 추출 --> 위험한 코드임
        //        // 따라서 if let 으로 추출
        
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let associatedConstantValue): accumulator = associatedConstantValue
            case .UnaryOperation(let associatedFunction): accumulator = associatedFunction(accumulator)
            case .BinaryOpeeration(let function):
                excutePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals:
                excutePendingBinaryOperation()
            }
        }
    }
    
    private func excutePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    private var pending: PendingBinaryOperationInfo?
    // 입력하지 않으면 nil이길 바라기 때문에 optional로 만들어줌
    
    
    // class와 비슷하지만 값으로 전달함 == 복사
    // class는 포인터로 가리킴
    // struct는 자동생성되는 초기화함수가 있음
    private struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
        
    }
    var reuslt: Double{
        // read Only property
        get {
            return accumulator
        }
    }
}
