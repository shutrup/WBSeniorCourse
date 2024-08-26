//
//  Project.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 26.08.2024.
//

import Foundation
import SwiftData

@Model
class Project {
    @Attribute var name: String
    @Attribute var tasks: [Task]

    init(name: String, tasks: [Task] = []) {
        self.name = name
        self.tasks = tasks
    }
}
