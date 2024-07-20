//
//  ContentView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 14.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigationModel = NavigationModel()
    
    var body: some View {
        CustomNavigationContainer(model: navigationModel) {
            VStack {
                Text("Main View")
                    .font(.largeTitle)
                
                Button("Push View") {
                    navigationModel.push(DetailView(navigationModel: navigationModel, title: "Pushed View"))
                }
                .padding()
                
                Button("Present View") {
                    navigationModel.present(DetailView(navigationModel: navigationModel, title: "Presented View"))
                }
                .padding()
                
                Button("Custom View") {
                    navigationModel.custom(DetailView(navigationModel: navigationModel, title: "Custom View"))
                }
                .padding()
            }
        }
    }
}

struct DetailView: View {
    @ObservedObject var navigationModel: NavigationModel
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            
            Button("Back") {
                navigationModel.pop()
            }
            .padding()
            
            Button("Back to Root") {
                navigationModel.popToRoot()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
