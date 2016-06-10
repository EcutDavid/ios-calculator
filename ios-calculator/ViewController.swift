//
//  ViewController.swift
//  ios-calculator
//
//  Created by Guan David on 6/6/16.
//  Copyright © 2016 David Guan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var resultLabel: UILabel!
    private var labelNeedClear = true
    private var calculatorModel = CalculatorModel()
    
    private var displayValue: Double {
        get {
            return Double(resultLabel.text!)!
        }
        
        set {
            resultLabel.text = String(newValue)
        }
    }
    
    @IBAction private func performOperaton(sender: UIButton) {
        labelNeedClear = true
        if let mathSymbol = sender.currentTitle {
            calculatorModel.performOperaton(mathSymbol)
        }
        displayValue = calculatorModel.result
    }
    
    @IBAction private func onTouch(sender: UIButton) {
        if labelNeedClear {
            labelNeedClear = false
            resultLabel.text = sender.currentTitle!
        } else {
            resultLabel.text = resultLabel.text! + sender.currentTitle!
        }
        calculatorModel.setOperand(Double(displayValue))
    }
}

