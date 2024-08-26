//
//  ContentView.swift
//  WatchTodoList Watch App
//
//  Created by Шарап Бамматов on 26.08.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var tasks: [Task]

    var body: some View {
        List {
            ForEach(tasks) { task in
                HStack {
                    Text(task.title)
                        .strikethrough(task.isCompleted)
                    Spacer()
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            toggleCompletion(task)
                        }
                }
            }
            .onDelete(perform: deleteTasks)
        }
        .navigationTitle("TODO List")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: addTask) {
                    Image(systemName: "plus")
                }
            }
        }
    }

    private func toggleCompletion(_ task: Task) {
        task.isCompleted.toggle()
        try? modelContext.save()
    }

    private func deleteTasks(offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            modelContext.delete(task)
        }
        try? modelContext.save()
    }

    private func addTask() {
        let newTask = Task(title: "New Task")
        modelContext.insert(newTask)
        try? modelContext.save()
    }
}

