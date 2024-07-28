//
//  TabButton.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 28.07.2024.
//

import SwiftUI

struct TabButton: View {
    let item: TabItem
    let isSelected: Bool
    let animation: Namespace.ID
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(item.icon)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding()
            }
            .frame(width: 48, height: 48)
            .background {
                if isSelected {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(.clear)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.wbPink, Color.wbPurple.opacity(0)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .cornerRadius(16)
                        )
                        .matchedGeometryEffect(id: "background", in: animation)
                } else {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundStyle(.clear)
                        .background(
                            .clear
                        )
                }
            }
//            .shadow(color: .white.opacity(isSelected ? 0.7 : 0), radius: 12, x: 0, y: 0)
        }
    }
}
