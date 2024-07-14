//
//  ContentView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 14.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authVm = AuthViewModel()

    var body: some View {
        NavigationStack {
            AuthScreen()
                .environmentObject(authVm)
                .preferredColorScheme(.dark)
        }
    }
}
