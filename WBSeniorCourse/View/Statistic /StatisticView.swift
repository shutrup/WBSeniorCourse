//
//  StatisticView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import SwiftUI

struct StatisticView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.wbGradientColor1, Color.wbGradientColor2]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            VStack {
                header
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 32)
        }
    }
}

private extension StatisticView {
    private var header: some View {
            HStack {
                Text("Статистика")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "rectangle.grid.2x2")
                            Text("Отображение виджетов")
                        }
                        .foregroundColor(.white)
                    }
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("Поделиться")
                        }
                        .foregroundColor(.white)
                    }
                }
            }
        }
}
