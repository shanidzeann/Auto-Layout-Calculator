//
//  CalculatorModel.swift
//  Auto Layout Calculator
//
//  Created by Анна Шанидзе on 30.08.2021.
//

import Foundation

struct CalculatorLogic {
    
    // MARK: - Properties
    
    private var number: Double?
    private var intermediateCalculator: (n1: Double, culcMethod: String)?
    
    // MARK: - Logic
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "C":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculator = (n1: n, culcMethod: symbol)
            }
        }
        return nil
    }
    
    func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculator?.n1,
           let operation = intermediateCalculator?.culcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "x":
                return n1 * n2
            case "-":
                return n1 - n2
            case "/":
                return n1 / n2
            default:
                return nil
            }
        }
        return nil
    }
    
}
