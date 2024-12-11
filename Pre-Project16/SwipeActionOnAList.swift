//
//  SwipeActionOnAList.swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 10/12/24.
//

import SwiftUI

struct SwipeActionOnAList: View {
    var body: some View {
        List {
            Text("Default Swipe (righ to left with gray button)")
                .swipeActions {
                    Button ("Send Message", systemImage: "message") {
                        print("Sending Message")
                    }
                }
            
            Text("Customazing the Swipe Buttons")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Deleting...")
                    }
                }
            
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning...")
                    }
                    .tint(.orange)
                }
            
            Text("Full Swiping actions")
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button("Call a Person...", systemImage: "phone") {
                        print("Calling...")
                    }
                    .tint(.cyan)
                    
                    Button("pin", systemImage: "pin") {
                        print("Pining...")
                    }
                    .tint(.orange)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button("Send a Message", systemImage: "message") {
                        print("Sending a Message...")
                    }
                    .tint(.green)
                }
            
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Deleting...")
                    }
                }
        }
    }
}

#Preview {
    SwipeActionOnAList()
}
