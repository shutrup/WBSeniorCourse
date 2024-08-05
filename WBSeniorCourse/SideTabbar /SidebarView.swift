//
//  SidebarView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 28.07.2024.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var store: Store<SidebarState, SidebarAction>
    @Namespace private var animation
    
    var body: some View {
        VStack {
            profileButton
            Spacer()
            tabButtons
            Spacer()
            addButton
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 16)
        .frame(width: 80)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.wbGradientColor1, Color.wbGradientColor2]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

private extension SidebarView {
    var profileButton: some View {
        Button {
            
        } label: {
            Image(.avatarProfile)
                .resizable()
                .frame(width: 44, height: 44)
        }
    }
    
    var tabButtons: some View {
        VStack(spacing: 64) {
            ForEach(TabItem.allCases, id: \.self) { item in
                TabButton(item: item, isSelected: store.state.selectedTab == item, animation: animation) {
                    withAnimation(.smooth) {
                        store.dispatch(action: .selectTab(item))
                    }
                }
            }
        }
    }
    
    var addButton: some View {
        Button {
            
        } label: {
            Image(systemName: "plus.circle")
                .imageScale(.large)
                .bold()
                .background {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(.white.opacity(0.08))
                }
                .foregroundStyle(.white)
        }
    }
}
