//
//  ViewController.swift
//  Caculator
//
//  Created by 毛雪峰 on 2017/7/15.
//  Copyright © 2017年 毛雪峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTyping = false
    
    var displayValue: Double{
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain: caculatorBrain = caculatorBrain()
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            
            let textCurrentlyInDisplay = display!.text!
            display!.text = textCurrentlyInDisplay + digit
        }
        else {
            display!.text = digit
            
            userIsInTheMiddleOfTyping = true
        }
        
        
    }
    @IBAction func performOperator(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle{
            switch mathematicalSymbol {
            case "π": displayValue = Double.pi
            default: break
            }
        }
    }
    
}

