//
//  SidebarReducer.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 28.07.2024.
//

import Foundation

class SidebarReducer {
    func reduce(state: SidebarState, action: SidebarAction) -> SidebarState {
        var newState = state
        
        switch action {
            case .selectTab(let tab):
                newState.selectedTab = tab
        }
        
        return newState
    }
}
