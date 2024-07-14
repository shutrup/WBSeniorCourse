//
//  PhoneMaskNumberField.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 30.06.2024.
//

import SwiftUI

struct PhoneMaskNumberField: View {
    @FocusState private var isFocused: Bool
    @Binding var model: PhoneModel
    
    var backgroundColor: Color {
        switch model.phoneValidState {
        case .failure:
            return .wbRed
        default:
            return .clear
        }
    }
    
    var errorTextPadding: CGFloat {
        switch model.phoneValidState {
        case .failure:
            return 16
        default:
            return 0
        }
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            textFieldView
                .onChange(of: model.phoneNumber) { newValue in
                    if newValue.count > model.phoneNumberSymbols {
                        model.phoneNumber = String(newValue.prefix(model.phoneNumberSymbols))
                    }
                }
                .zIndex(1)
            
            phoneNumberMaskView
            
            clearButton
                .zIndex(2)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = true
        }
    }
}

private extension PhoneMaskNumberField {
    var textFieldView: some View {
        VStack(alignment: .leading, spacing: 0) {
            errorMessage
            TextField("", text: $model.phoneNumber)
                .focused($isFocused)
                .accentColor(.clear)
                .foregroundColor(.clear)
                .font(Font.mMedium(size: 16))
                .keyboardType(.numberPad)
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 16)
        .frame(height: 48)
        .foregroundColor(.wbDescriptionGray)
        .background(Color.white.opacity(0.08))
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 1)
                .fill(backgroundColor)
                .animation(.easeInOut(duration: 0.3), value: model.phoneValidState)
        )
        .cornerRadius(12)
    }
    
    var phoneNumberMaskView: some View {
        Text(model.maskedPhoneNumber(isFocused: isFocused))
            .padding(.top, errorTextPadding)
            .padding(.leading, 16)
            .foregroundColor(.wbWhite)
            .animation(.easeInOut(duration: 0.3), value: model.phoneValidState)
    }
    
    @ViewBuilder
    var errorMessage: some View {
        if model.phoneValidState == .failure {
            Text("Некорректный формат номера")
                .font(Font.mMedium(size: 12))
                .foregroundColor(.wbRed)
                .animation(.easeInOut(duration: 0.3), value: model.phoneValidState)
        }
    }
    
    @ViewBuilder
    var clearButton: some View {
        if isFocused && model.phoneNumber.isNotEmpty {
            Button {
                model.phoneNumber = ""
            } label: {
                Circle()
                    .fill(Color.wbWhite)
                    .frame(width: 16.5, height: 16.5)
                    .overlay(
                        Image(systemName: "xmark")
                            .font(.mBold(size: 12))
                            .imageScale(.small)
                            .foregroundColor(.black)
                    )
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(12)
        }
    }
}
