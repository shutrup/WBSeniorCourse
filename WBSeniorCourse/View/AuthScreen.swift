//
//  AuthScreen.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 04.07.2024.
//

import SwiftUI

struct AuthScreen: View {
    @StateObject var authVm = AuthViewModel()

    var body: some View {
        IpadContainerView {
            VStack(spacing: 16) {
                title
                
                avatar
                
                subTitle
                
                PhoneMaskNumberField(model: $authVm.phoneModel)
                    .padding(.top, 16)
                
                if !Constants.isIpad {
                    Spacer()
                }
                
                WBButton(title: "Запросить код", isLoading: authVm.phoneModel.phoneValidState == .loading) {
                    authVm.phoneModel.phoneValidState = .loading
                    
                    Task {
                        try await Task.sleep(nanoseconds: 1_000_000_000)
                        authVm.phoneModel.validateFields()
                    }
                }
            }
            .padding(24)
            .background(CustomGradient.bgGradient.ignoresSafeArea())
            .navigationDestination(isPresented: Binding(
                get: { authVm.phoneModel.phoneValidState == .success },
                set: { _, _ in })) {
                    InputCodeScreen()
                        .environmentObject(authVm)
                }
        }
    }
}

private extension AuthScreen {
    var title: some View {
        Text("Авторизация")
            .font(.mSemiBold(size: 24))
            .foregroundColor(.wbWhite)
    }
    
    var avatar: some View {
        Image(.avatarProfile)
            .resizable()
            .frame(width: 96, height: 96)
            .padding(.top, 12)
    }
    
    var subTitle: some View {
        Text("Вход по номеру телефона")
            .font(.mRegular(size: 14))
            .foregroundColor(.wbWhite)
    }
}
