//
//  AuthViewModel.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 04.07.2024.
//

import SwiftUI
import Combine

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var phoneModel = PhoneModel(phoneNumber: "", phoneValidState: .none)
    @Published var otpText: String = String()
    @Published var otpState: OTPState = .none
    @Published var resendCodeDisabled: Bool = Bool()
    @Published var remainingTime: Int = Int()
    
    private var timer: AnyCancellable?
    
    func checkCode() {
        otpState = .loading
        
        Task {
            try await Task.sleep(nanoseconds: 500_000_000)
            
            withAnimation {
                if otpText == "4444" {
                    otpState = .success
                } else if otpText == "" {
                    otpState = .none
                } else {
                    otpState = .failure
                }
            }
        }
    }
    
    func startTimer() {
        remainingTime = 60
        resendCodeDisabled = true
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if self.remainingTime > 0 {
                    self.remainingTime -= 1
                } else {
                    self.stopTimer()
                }
            }
    }
    
    func stopTimer() {
        timer?.cancel()
        timer = nil
        resendCodeDisabled = false
    }
    
    func initialValue() {
        otpText = ""
        otpState = .none
        if !resendCodeDisabled {
            startTimer()
        }
    }
}
