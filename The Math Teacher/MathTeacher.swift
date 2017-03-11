//
//  MathTeacher.swift
//  The Math Teacher
//
//  Created by Sahil Nokhwal on 2/15/16.
//  Copyright © 2016 Sahil Nokhwal. All rights reserved.
//

import Foundation


class  MathTeacher{

enum OperationType:String{
    case Plus = "+", Minus = "-"
}
var operation:OperationType = .Plus



var operand1:Int = 1
var operand2:Int = 1
var maximumProblemSize:Int = 9
var history:String = ""

    
    func makeNewProblem(){
       let max = maximumProblemSize + 1
        operand1 = random() % max
        operand2 = random() % max
    }
    
    
    func answerIsCorrect(operationResult:Int) -> Bool{
        var total:Int = 0
        switch operation{
        case .Plus:
            total = operand1 + operand2
        case .Minus:
            total = operand1 - operand2
        }
        
        history += "\(operand1) \(operation.rawValue) \(operand2) = \(operationResult); \(total == operationResult) \n"
        return total == operationResult
    
    }
    
    

    
}