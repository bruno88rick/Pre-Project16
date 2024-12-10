//
//  TabViewProgrammatically.swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 09/12/24.
//

import SwiftUI

struct TabViewProgrammatically: View {
    
    ///1-Create an @State property to track the tab that is currently showing.
    @State private var selectedTab = "One"
    
    var body: some View {
        ///3-Pass that as a binding into the TabView, so it will be tracked automatically.
        TabView(selection: $selectedTab) {
            ///2-Modify that property to a new value whenever we want to jump to a different tab.
            Button("Show tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "person")
            }
            .tag("One")
            
            Text("Two")
                .tabItem {
                    Label("Two", systemImage: "star")
                }
                ///4-Tell SwiftUI which tab should be shown for each value of that property.
                .tag("Two")
        }
    }
}

#Preview {
    TabViewProgrammatically()
}
