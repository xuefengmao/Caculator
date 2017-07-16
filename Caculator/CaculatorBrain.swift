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
    private enum Operation {
        
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    
    private var operations :Dictionary<String,Operation> = [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "+": Operation.binaryOperation({$0 + $1}),
        "−": Operation.binaryOperation({$0 - $1}),
        "×": Operation.binaryOperation({$0 * $1}),
        "÷": Operation.binaryOperation({$0 / $1}),
        "=": Operation.equals,
        "±": Operation.unaryOperation({-$0})
        
    ]
    
   mutating func performOperation(_ Symbol: String){
        if let operation = operations [Symbol]{
            switch operation {
                
            case .constant(let value):
                accumulator = value
            case .unaryOperation (let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperate = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                    
                }
            case .equals:
                performPendingBinaryOperation()

                
            }
            
        }
    }
    
   private mutating func performPendingBinaryOperation () {
        if pendingBinaryOperate != nil && accumulator != nil{
          accumulator = pendingBinaryOperate!.perform(with: accumulator!)
            pendingBinaryOperate = nil
        }
    }
    private var pendingBinaryOperate: PendingBinaryOperation?
    
    
    private struct PendingBinaryOperation{
        let function :(Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double{
            return function(firstOperand , secondOperand)
        }
        
        
    }
    mutating func setOperand(_ operand: Double){
        accumulator = operand
        
    }
    
    var result: Double?{
        get{
            return accumulator
        }
    }

}

        
    
