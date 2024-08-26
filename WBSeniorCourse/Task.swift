//
//  Task.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 26.08.2024.
//

import Foundation
import SwiftData

@Model
class Task {
    @Attribute var title: String
    @Attribute var isCompleted: Bool
    @Relationship var project: Project?

    init(title: String, isCompleted: Bool = false, project: Project? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.project = project
    }
}
