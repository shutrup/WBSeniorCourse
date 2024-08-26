//
//  ProjectDetailView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 26.08.2024.
//

import SwiftUI
import SwiftData

struct ProjectDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var project: Project

    @State private var filterCompleted = false
    @State private var sortByTitle = false

    var body: some View {
        VStack {
            Toggle("Show Completed", isOn: $filterCompleted)
                .padding()

            Toggle("Sort by Title", isOn: $sortByTitle)
                .padding()

            List {
                ForEach(filteredAndSortedTasks) { task in
                    HStack {
                        TextField("Task Title", text: Binding(
                            get: { task.title },
                            set: { newValue in
                                task.title = newValue
                                try? modelContext.save()
                            }
                        ))
                        Spacer()
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .onTapGesture {
                                toggleCompletion(task)
                            }
                    }
                }
                .onDelete(perform: deleteTasks)
            }
        }
        .navigationTitle(project.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addTask) {
                    Image(systemName: "plus")
                }
            }
        }
    }

    private var filteredAndSortedTasks: [Task] {
        var tasks = project.tasks
        if filterCompleted {
            tasks = tasks.filter { $0.isCompleted }
        }
        if sortByTitle {
            tasks.sort { $0.title < $1.title }
        }
        return tasks
    }

    private func toggleCompletion(_ task: Task) {
        task.isCompleted.toggle()
        try? modelContext.save()
    }

    private func deleteTasks(offsets: IndexSet) {
        for index in offsets {
            let task = filteredAndSortedTasks[index]
            modelContext.delete(task)
        }
        try? modelContext.save()
    }

    private func addTask() {
        let newTask = Task(title: "New Task", project: project)
        modelContext.insert(newTask)
        try? modelContext.save()
    }
}
