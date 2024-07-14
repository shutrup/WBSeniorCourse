//
//  HiddenNavigationBar.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 04.07.2024.
//

import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}
