//
//  CustomGradient.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 01.07.2024.
//

import SwiftUI

struct CustomGradient {
    static let bgGradient = LinearGradient(
        gradient: Gradient(colors: [Color(hex: "#1D0628"), Color(hex: "#0F0A23")]),
        startPoint: .top,
        endPoint: .bottom
    )
}
