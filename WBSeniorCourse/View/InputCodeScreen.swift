//
//  InputCodeScreen.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 04.07.2024.
//

import SwiftUI

struct InputCodeScreen: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authVm: AuthViewModel
    
    var body: some View {
        IpadContainerView(isBackButton: true) {
            VStack(spacing: 16) {
                backButton
                
                icon
                
                phoneNumber
                
                OTPView(text: $authVm.otpText, otpState: authVm.otpState)
                    .padding(.top, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                if authVm.resendCodeDisabled {
                    timerView
                } else {
                    sendAgainButton
                }
                
                WBButton(title: "Авторизоваться", isLoading: authVm.otpState == .loading) {
                    authVm.checkCode()
                }
            }
            .padding(Constants.isIpad ? 40 : 24)
            .background(CustomGradient.bgGradient.ignoresSafeArea())
        }
        .onAppear {
            authVm.initialValue()
        }
        .onDisappear {
            authVm.phoneModel.phoneValidState = .none
        }
        .hideKeyboardOnTap()
        .hiddenNavigationBar()
    }
}


private extension InputCodeScreen {
    @ViewBuilder
    var backButton: some View {
        if !Constants.isIpad {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var icon: some View {
        Image(.mailIcon)
            .resizable()
            .frame(width: 40, height: 40)
    }
    
    var phoneNumber: some View {
        Text(authVm.phoneModel.formattedPhoneNumber)
            .font(.mSemiBold(size: 24))
            .foregroundColor(.wbWhite)
    }
    
    var sendAgainButton: some View {
        Button {
            authVm.startTimer()
        } label: {
            Text("Отправить код повторно")
                .font(.mRegular(size: 14))
                .foregroundStyle(.wbWhite)
                .padding(10)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    var timerView: some View {
        Text("Запросить повторно \(formattedTime)")
            .font(.mRegular(size: 14))
            .foregroundStyle(.wbWhite)
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    var formattedTime: String {
        let minutes = authVm.remainingTime / 60
        let seconds = authVm.remainingTime % 60
        return String(format: "%01d:%02d", minutes, seconds)
    }
}
