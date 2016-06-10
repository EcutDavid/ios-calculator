//
//  CalculatorModel.swift
//  ios-calculator
//
//  Created by Guan David on 6/10/16.
//  Copyright © 2016 David Guan. All rights reserved.
//

import Foundation

class CalculatorModel {
    private var oprations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E),
        "±": Operation.unaryOperation({ -$0 }),
        "+": Operation.binaryOperation({ $0 + $1 }),
        "-": Operation.binaryOperation({ $0 - $1 }),
        "*": Operation.binaryOperation({ $0 * $1 }),
        "/": Operation.binaryOperation({ $0 / $1 }),
        "=": Operation.Equals
    ]
    private enum Operation {
        case Constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case Equals
    }
    private struct PendingOperationInfo {
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
            case .unaryOperation(let function):
                accumulator = function(accumulator)
            case .binaryOperation(let function):
                excutePendingOperation()
                pendingValue = PendingOperationInfo(pendingValue: accumulator, pendingOperation: function)
            case .Equals:
                excutePendingOperation()
            }
        }
    }
    private func excutePendingOperation() {
        if let operation = pendingValue {
            accumulator = operation.pendingOperation(operation.pendingValue, accumulator)
            pendingValue = nil
        }
    }
}