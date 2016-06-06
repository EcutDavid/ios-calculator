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
    
    @IBAction func onTouch(sender: UIButton) {
        print(resultLabel.text!)
    }
}

