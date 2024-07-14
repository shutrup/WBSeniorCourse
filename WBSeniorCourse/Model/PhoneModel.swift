//
//  PhoneModel.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 01.07.2024.
//

import Foundation

struct PhoneModel {
    let phoneNumberSymbols = 10
    var phoneNumber = ""
    var phoneValidState: PhoneValidState = .none
    
    var isFieldsValid: Bool {
        phoneValidState == .success &&
        phoneNumber.isNotEmpty
    }
    
    var formattedPhoneNumber: String {
        let rawPhoneNumber = phoneNumber
        let mask = "__________"
        let digits = rawPhoneNumber + mask.suffix(max(0, 10 - rawPhoneNumber.count))
        
        let formattedPhoneNumber = "+7 (\(digits.prefix(3))) \(digits.prefix(6).suffix(3))-\(digits.prefix(8).suffix(2))-\(digits.prefix(10).suffix(2))"
        
        return formattedPhoneNumber
    }
    
    func maskedPhoneNumber(isFocused: Bool) -> String {
        let mask = "__________"
        let cursor = isFocused ? "|" : ""
        let dots = phoneNumber.count > 10 ? phoneNumber : phoneNumber + mask.suffix(mask.count - phoneNumber.count)
        
        var formattedPhoneNumber = "+7 (\(dots.prefix(3))) \(dots.prefix(6).suffix(3))-\(dots.suffix(4).prefix(2))-\(dots.suffix(2))"
        
        if isFocused {
            var cursorPosition = phoneNumber.count + 4
            
            if phoneNumber.count > 3 {
                cursorPosition += 2
            }
            
            if phoneNumber.count > 6 {
                cursorPosition += 1
            }
            
            if phoneNumber.count > 8 {
                cursorPosition += 1
            }
            
            cursorPosition = min(cursorPosition, formattedPhoneNumber.count)
            let index = formattedPhoneNumber.index(formattedPhoneNumber.startIndex, offsetBy: cursorPosition)
            formattedPhoneNumber.insert(contentsOf: cursor, at: index)
        }
        
        return formattedPhoneNumber
    }
    
    mutating func validateFields() {
        if phoneNumber.count == phoneNumberSymbols {
            phoneValidState = .success
        } else {
            phoneValidState = .failure
        }
    }
}
