//
//  ContentView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 14.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = Store<SidebarState, SidebarAction>(
        initialState: SidebarState(),
        reducer: SidebarReducer().reduce
    )
    
    var body: some View {
        HStack(spacing: 0) {
            SidebarView()
                .environmentObject(store)
            
            Text("Выбранная вкладка: \(store.state.selectedTab)")
                .font(.largeTitle)
                .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
