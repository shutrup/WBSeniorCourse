//
//  WBButton.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 01.07.2024.
//

import SwiftUI

struct WBButton: View {
    let title: String
    var isLoading: Bool? = false
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Group {
                if isLoading == true {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                        .zIndex(1)
                }
            }
            .font(.mMedium(size: 16))
            .foregroundColor(.wbWhite)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(Color.wbPurple)
            .cornerRadius(12, corners: .allCorners)
        }
    }
}

