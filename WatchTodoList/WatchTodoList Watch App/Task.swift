//
//  Task.swift
//  WatchTodoList Watch App
//
//  Created by Шарап Бамматов on 26.08.2024.
//

import Foundation
import SwiftData

@Model
class Task: Identifiable {
    @Attribute var title: String
    @Attribute var isCompleted: Bool

    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
