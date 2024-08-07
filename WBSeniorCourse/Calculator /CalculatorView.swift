//
//  CalculatorView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import SwiftUI

struct CalculatorView: View {
    @StateObject private var viewModel = CalculatorViewModel()

    let buttons: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", "C", "=", "+"]
    ]

    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.display)
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.gray.opacity(0.2))
                .accessibilityIdentifier("result")

            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            handleButtonPress(button)
                        }) {
                            Text(button)
                                .font(.largeTitle)
                                .frame(width: 80, height: 80)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(40)
                                .accessibilityIdentifier(button)
                        }
                    }
                }
            }
        }
        .padding()
    }

    private func handleButtonPress(_ button: String) {
        switch button {
        case "0"..."9":
            viewModel.inputNumber(Int(button)!)
        case "+", "-", "*", "/":
            viewModel.setOperator(button)
        case "=":
            viewModel.calculate()
        case "C":
            viewModel.clear()
        default:
            break
        }
    }
}
