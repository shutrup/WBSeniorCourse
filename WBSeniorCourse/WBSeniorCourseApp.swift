//
//  WBSeniorCourseApp.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 14.07.2024.
//

import SwiftUI

@main
struct WBSeniorCourseApp: App {
    @StateObject private var localizationService = LocalizationService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(localizationService)
        }
    }
}
