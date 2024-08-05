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
            
            switch store.state.selectedTab {
                case .statistic:
                    StatisticView()
                case .chat:
                    ChatView()
                case .fire:
                    FireView()
                case .calendar:
                    CalendarView()
                case .settings:
                    SettingsView()
            }
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
