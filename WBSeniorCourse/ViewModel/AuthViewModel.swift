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
}
