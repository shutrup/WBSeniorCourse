//
//  ProjectListView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 26.08.2024.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var projects: [Project]

    var body: some View {
        NavigationView {
            List {
                ForEach(projects) { project in
                    NavigationLink(destination: ProjectDetailView(project: project)) {
                        Text(project.name)
                    }
                }
                .onDelete(perform: deleteProjects)
            }
            .navigationTitle("Projects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addProject) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    private func addProject() {
        let newProject = Project(name: "New Project")
        modelContext.insert(newProject)
        try? modelContext.save()
    }

    private func deleteProjects(offsets: IndexSet) {
        for index in offsets {
            let project = projects[index]
            modelContext.delete(project)
        }
        try? modelContext.save()
    }
}

