//
//  ContentView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 14.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var cargoCollection = CargoCollection()
    @State private var totalVolume: Double = 0.0
    
    var body: some View {
        VStack {
            addButton
            volumeText
        }
        .padding()
    }
}
private extension ContentView {
    var addButton: some View {
        Button(action: addCargo) {
            Text("Add Cargo")
        }
    }
    
    var volumeText: some View {
        Text("Total Volume: \(totalVolume, specifier: "%.2f") cubic meters")
            .padding(.top, 10)
    }
    
    func addCargo() {
        let newCargo = Cargo(
            width: Double.random(in: 1...3),
            height: Double.random(in: 1...3),
            depth: Double.random(in: 1...3)
        )
        cargoCollection.add(newCargo)
        
        if cargoCollection.count >= 2 {
            if let lastCargo = cargoCollection[cargoCollection.count - 1],
               let previousCargo = cargoCollection[cargoCollection.count - 2] {
                totalVolume = previousCargo +++ lastCargo
            }
        }
    }
}

#Preview {
    ContentView()
}
