//
//  CalculatorTests.swift
//  WBSeniorCourseTests
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import XCTest
@testable import WBSeniorCourse

class CalculatorTests: XCTestCase {
    
    var calculator: Calculatable!
    
    override func setUpWithError() throws {
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        calculator = nil
    }

    func testAddition() throws {
        let result = calculator.add(2, 3)
        XCTAssertEqual(result, 5)
    }
    
    func testSubtraction() throws {
        let result = calculator.subtract(5, 3)
        XCTAssertEqual(result, 2)
    }
    
    func testMultiplication() throws {
        let result = calculator.multiply(2, 3)
        XCTAssertEqual(result, 6)
    }
    
    func testDivision() throws {
        let result = try calculator.divide(6, 3)
        XCTAssertEqual(result, 2)
    }
    
    func testDivisionByZero() throws {
        XCTAssertThrowsError(try calculator.divide(6, 0)) { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.divisionByZero)
        }
    }
}
