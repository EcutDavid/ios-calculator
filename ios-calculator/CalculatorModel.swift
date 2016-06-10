//
//  CalculatorModel.swift
//  ios-calculator
//
//  Created by Guan David on 6/10/16.
//  Copyright © 2016 David Guan. All rights reserved.
//

import Foundation

class CalculatorModel {
    private var accumulator = 0.0
    var result: Double {
        get {
            return accumulator
        }
    }
    var oprations: Dictionary<String, Operation> = [
        "π": Operation.Constant(M_PI),
        "e": Operation.Constant(M_E)
    ]
    enum Operation {
        case Constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    func setOperand(value: Double) {
        accumulator = value
    }
    func performOperaton(symbol: String) {
        if let constant = oprations[symbol] {
            switch constant {
            case .Constant(let value): accumulator = value
            case .unaryOperation: break
            case .binaryOperation: break
            case .Equals: break
            }
        }
    }
}