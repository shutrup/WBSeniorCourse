//
//  IpadContainerView.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 06.07.2024.
//

import SwiftUI

struct IpadContainerView<Content: View>: View {
    @Environment(\.dismiss) var dismiss
    var isBackButton: Bool
    let content: Content

    init(isBackButton: Bool = false, @ViewBuilder content: () -> Content) {
        self.isBackButton = isBackButton
        self.content = content()
    }

    var body: some View {
        ZStack {
            image
            
            VStack(spacing: 32) {
                content
                    .cornerRadius(Constants.isIpad ? 28 : 0, corners: .allCorners)
                
                if isBackButton {
                    backButton
                }
            }
            .frame(maxWidth: Constants.isIpad ? Constants.width / 2.1 : .infinity,
                   maxHeight: Constants.isIpad ? Constants.width / 1.95 : .infinity)
            .hideKeyboardOnTap()
            .hiddenNavigationBar()
        }
    }
}

private extension IpadContainerView {
    @ViewBuilder
    var image: some View {
        if Constants.isIpad {
            Image(.background)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            CustomGradient.bgGradient.ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    var backButton: some View {
        if Constants.isIpad {
            Button {
                dismiss()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                    
                    Text("Вернуться назад")
                        .font(.mRegular(size: 14))
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

