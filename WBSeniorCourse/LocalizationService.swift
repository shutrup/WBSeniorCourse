//
//  LocalizationService.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 20.07.2024.
//

import Foundation

class LocalizationService: ObservableObject {
    @Published var currentLanguage: String {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "appLanguage")
            Bundle.setLanguage(currentLanguage)
        }
    }
    
    init() {
        self.currentLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "en"
        Bundle.setLanguage(currentLanguage)
    }
}
