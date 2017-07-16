//
//  CaculatorBrain.swift
//  Caculator
//
//  Created by 毛雪峰 on 2017/7/16.
//  Copyright © 2017年 毛雪峰. All rights reserved.
//

import Foundation

struct caculatorBrain {
    
    private var accumulator: Double?
    func performOperation(_ symbol: String){
        
    }
    
    mutating func setOperand(_ operand: Double){
        
        accumulator = operand
        
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
}
