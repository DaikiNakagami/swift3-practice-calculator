//
//  ViewController.swift
//  calculator
//
//  Created by Irfan Ahmed on 10/15/16.
//  Copyright © 2016 Irfan Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var typing = false
    var previousValue: Double = 0.0
    var currentOperator: String?
    
    @IBAction func touchButton(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if typing {
                let currentDisplay = display.text! + digit
                display.text = currentDisplay
            } else {
                display.text = digit
            }
        }
        
        typing = true
    }
    
    @IBAction func touchOperand(_ sender: UIButton) {
        currentOperator = sender.currentTitle!
        previousValue = Double(display.text!)!
        typing = false
    }
    
    
    @IBAction func equalButton(_ sender: UIButton) {
        
        if currentOperator == "+" {
            previousValue += Double(display.text!)!
        } else if currentOperator == "-" {
            previousValue -= Double(display.text!)!
        } else if currentOperator == "÷" {
            previousValue /= Double(display.text!)!
        } else if currentOperator == "x" {
            previousValue *= Double(display.text!)!
        }
        
        
        display.text = String(previousValue)
        previousValue = 0.0
        typing = false
        currentOperator = nil
    }
}

