//
//  ContentView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 14.07.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var localizationService: LocalizationService
    
    var body: some View {
        VStack {
            Text(
                NSLocalizedString("greeting",
                comment: "")
            )
                .padding()
            
            DateView()
                .environmentObject(localizationService)
            
            DistanceView()
                .environmentObject(localizationService)
            
            Button {
                localizationService.currentLanguage = localizationService.currentLanguage == "en" ? "ru" : "en"
            } label: {
                Text(
                    NSLocalizedString("change_language",
                    comment: "")
                )
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
