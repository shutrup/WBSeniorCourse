//
//  DateView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 20.07.2024.
//

import SwiftUI

struct DateView: View {
    @EnvironmentObject var localizationService: LocalizationService
    
    var body: some View {
        VStack {
            Text("\(NSLocalizedString("short", comment: "")): \(formattedDate(date: Date(), style: .short))")
            Text("\(NSLocalizedString("medium", comment: "")): \(formattedDate(date: Date(), style: .medium))")
            Text("\(NSLocalizedString("long", comment: "")): \(formattedDate(date: Date(), style: .long))")
        }
    }
    
    func formattedDate(date: Date, style: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = style
        return formatter.string(from: date)
    }
}
