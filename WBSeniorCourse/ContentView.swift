//
//  ContentView.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 14.07.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var multipeerService = MultipeerService()
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            Text("Status: \(multipeerService.connectionStatus)")
                .padding()
            
            List(multipeerService.receivedMessages, id: \.self) { message in
                Text(message)
            }
            
            HStack {
                TextField("Enter message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    multipeerService.send(message: messageText)
                    messageText = ""
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
