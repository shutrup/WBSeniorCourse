//
//  CalculatorUITests.swift
//  WBSeniorCourseTests
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import XCTest

class CalculatorUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testAddition() throws {
        let button1 = app.buttons["1"]
        let button2 = app.buttons["2"]
        let buttonAdd = app.buttons["+"]
        let buttonEquals = app.buttons["="]
        let result = app.staticTexts["result"]

        button1.tap()
        buttonAdd.tap()
        button2.tap()
        buttonEquals.tap()

        XCTAssertEqual(result.label, "3")
    }

    func testSubtraction() throws {
        let button9 = app.buttons["9"]
        let button5 = app.buttons["5"]
        let buttonSubtract = app.buttons["-"]
        let buttonEquals = app.buttons["="]
        let result = app.staticTexts["result"]

        button9.tap()
        buttonSubtract.tap()
        button5.tap()
        buttonEquals.tap()

        XCTAssertEqual(result.label, "4")
    }

    func testMultiplication() throws {
        let button3 = app.buttons["3"]
        let button4 = app.buttons["4"]
        let buttonMultiply = app.buttons["*"]
        let buttonEquals = app.buttons["="]
        let result = app.staticTexts["result"]

        button3.tap()
        buttonMultiply.tap()
        button4.tap()
        buttonEquals.tap()

        XCTAssertEqual(result.label, "12")
    }

    func testDivision() throws {
        let button8 = app.buttons["8"]
        let button2 = app.buttons["2"]
        let buttonDivide = app.buttons["/"]
        let buttonEquals = app.buttons["="]
        let result = app.staticTexts["result"]

        button8.tap()
        buttonDivide.tap()
        button2.tap()
        buttonEquals.tap()

        XCTAssertEqual(result.label, "4")
    }

    func testClear() throws {
        let button8 = app.buttons["8"]
        let buttonClear = app.buttons["C"]
        let result = app.staticTexts["result"]

        button8.tap()
        buttonClear.tap()

        XCTAssertEqual(result.label, "0")
    }
}
