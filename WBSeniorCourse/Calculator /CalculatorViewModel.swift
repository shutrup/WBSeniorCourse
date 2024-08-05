//
//  CalculatorViewModel.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var display: String = "0"
    
    private var currentOperator: String? = nil
    private var currentNumber: Double = 0
    private var previousNumber: Double? = nil
    
    func inputNumber(_ number: Int) {
        if display == "0" {
            display = "\(number)"
        } else {
            display += "\(number)"
        }
        currentNumber = Double(display) ?? 0
    }
    
    func setOperator(_ operator: String) {
        if let previousNumber = previousNumber {
            calculate()
            self.previousNumber = Double(display)
        } else {
            previousNumber = currentNumber
        }
        currentOperator = `operator`
        display = "0"
    }
    
    func calculate() {
        guard let previousNumber = previousNumber, let currentOperator = currentOperator else { return }
        let result: Double
        
        switch currentOperator {
        case "+":
            result = previousNumber + currentNumber
        case "-":
            result = previousNumber - currentNumber
        case "*":
            result = previousNumber * currentNumber
        case "/":
            result = currentNumber != 0 ? previousNumber / currentNumber : 0
        default:
            return
        }
        
        display = String(result)
        self.previousNumber = nil
        self.currentOperator = nil
        self.currentNumber = result
    }
    
    func clear() {
        display = "0"
        currentNumber = 0
        previousNumber = nil
        currentOperator = nil
    }
}

