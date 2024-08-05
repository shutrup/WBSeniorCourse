//
//  TabItem.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 28.07.2024.
//

import SwiftUI

enum TabItem: Hashable, CaseIterable {
    case statistic
    case chat
    case fire
    case calendar
    case settings
    
    var icon: String {
        switch self {
        case .statistic:
            "statistic"
        case .chat:
            "chat"
        case .fire:
            "fire"
        case .calendar:
            "calendar"
        case .settings:
            "settings"
        }
    }
}

