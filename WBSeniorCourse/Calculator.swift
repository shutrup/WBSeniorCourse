//
//  Calculator.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import Foundation

protocol Calculatable {
    func add(_ a: Double, _ b: Double) -> Double
    func subtract(_ a: Double, _ b: Double) -> Double
    func multiply(_ a: Double, _ b: Double) -> Double
    func divide(_ a: Double, _ b: Double) throws -> Double
}

enum CalculatorError: Error {
    case divisionByZero
}

class Calculator: Calculatable {
    func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    func subtract(_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    
    func multiply(_ a: Double, _ b: Double) -> Double {
        return a * b
    }
    
    func divide(_ a: Double, _ b: Double) throws -> Double {
        guard b != 0 else {
            throw CalculatorError.divisionByZero
        }
        return a / b
    }
}


