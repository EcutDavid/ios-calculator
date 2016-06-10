//
//  CalculatorModel.swift
//  ios-calculator
//
//  Created by Guan David on 6/10/16.
//  Copyright © 2016 David Guan. All rights reserved.
//

import Foundation

func plus(arg1: Double , arg2: Double) -> Double {
    return arg1 + arg2
}

func minus(arg1: Double , arg2: Double) -> Double {
    return arg1 - arg2
}

func multiply(arg1: Double , arg2: Double) -> Double {
    return arg1 * arg2
}

func divide(arg1: Double , arg2: Double) -> Double {
    return arg1 / arg2
}

class CalculatorModel {
    var oprations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "+": Operation.binaryOperation(plus),
        "-": Operation.binaryOperation(minus),
        "*": Operation.binaryOperation(multiply),
        "/": Operation.binaryOperation(divide),
        "=": Operation.Equals
    ]
    enum Operation {
        case Constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case Equals
    }
    struct PendingOperationInfo {
        var pendingValue: Double
        var pendingOperation: (Double, Double) -> Double
    }
    
    private var accumulator = 0.0
    var result: Double {
        get {
            return accumulator
        }
    }
    private var pendingValue: PendingOperationInfo?

    func setOperand(value: Double) {
        accumulator = value
    }
    func performOperaton(symbol: String) {
        if let constant = oprations[symbol] {
            switch constant {
            case .Constant(let value):
                accumulator = value
            case .unaryOperation: break
            case .binaryOperation(let function):
                excutePendingOperation()
                pendingValue = PendingOperationInfo(pendingValue: accumulator, pendingOperation: function)
            case .Equals:
                excutePendingOperation()
            }
        }
    }
    func excutePendingOperation() {
        if let operation = pendingValue {
            accumulator = operation.pendingOperation(operation.pendingValue, accumulator)
            pendingValue = nil
        }
    }
}