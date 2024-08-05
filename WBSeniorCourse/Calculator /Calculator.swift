//
//  Calculator.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import Foundation

protocol Calculatable {
    func add<T: Numeric>(_ a: T, _ b: T) -> T
    func subtract<T: Numeric>(_ a: T, _ b: T) -> T
    func multiply<T: Numeric>(_ a: T, _ b: T) -> T
    func divide<T: FloatingPoint>(_ a: T, _ b: T) throws -> T
}

class Calculator: Calculatable {
    func add<T: Numeric>(_ a: T, _ b: T) -> T {
        return a + b
    }
    
    func subtract<T: Numeric>(_ a: T, _ b: T) -> T {
        return a - b
    }
    
    func multiply<T: Numeric>(_ a: T, _ b: T) -> T {
        return a * b
    }
    
    func divide<T: FloatingPoint>(_ a: T, _ b: T) throws -> T {
        guard b != 0 else {
            throw CalculatorError.divisionByZero
        }
        return a / b
    }
}

enum CalculatorError: Error {
    case divisionByZero
}
