//
//  ViewController.swift
//  ios-calculator
//
//  Created by Guan David on 6/6/16.
//  Copyright © 2016 David Guan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    var labelNeedClear = true
    
    @IBAction func performOperaton(sender: UIButton) {
        labelNeedClear = true
        if let mathSymbol = sender.currentTitle {
            if mathSymbol == "π" {
                resultLabel.text = String(M_PI)
            }
        }
    }
    
    @IBAction func onTouch(sender: UIButton) {
       
        var displayText = resultLabel.text!
        if labelNeedClear {
            labelNeedClear = false
            displayText = sender.currentTitle!
        } else {
            displayText += sender.currentTitle!
        }
        
        if sender.currentTitle! == "π" {
            resultLabel.text = String(M_PI)
            return
        }
        
        resultLabel.text = displayText
    }
}

