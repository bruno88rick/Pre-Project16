//
//  TabView&TabItem.swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 09/12/24.
//

import SwiftUI

struct TabView_TabItem: View {
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Label("One", systemImage: "star")
                }
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
        }
    }
}

#Preview {
    TabView_TabItem()
}
