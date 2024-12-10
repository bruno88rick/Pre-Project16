//
//  SelectionOnLists.swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 23/11/24.
//

import SwiftUI

struct SelectionOnLists: View {
    let users = ["Bruno", "Dayane", "Miguel", "Ana", "Osana", "Andressa"]
    
    //creating some state to store whatever row is tapped
    ///As our list shows strings, this means making the selected value be an optional string – nothing will be selected by default, but it will contain a user's name when their row is tapped on
    @State private var selection: String?
    
    // to handle with multiple selection lists
    @State private var multipleSelection = Set<String>()
    
    var body: some View {
        ///we need to tell our list to update that state when a row is tapped. This is a two-way binding, which means tapping a row updates the property, but also updating the property will select the row
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        .padding()
        
        List(users, id: \.self, selection: $multipleSelection) { user in
            Text(user)
        }
        
        //we can now go ahead and use that selection somehow. For example, we could show some text below the list if there's a selection
        if let selection {
            Text("You selected \(selection)")
        }
        
        ///If you want to upgrade this to handle multiple selection, you need to change the selection property so that it stores a set of values. This can be empty by default, to mean nothing is selected. So change the seleciton property to: @State private var selection = Set<String>()
        
        //And when it comes to displaying the selection, we can call formatted() on the set to display all the names as a single string
        if multipleSelection.isEmpty == false {
            Text("You Selected \(multipleSelection.formatted())")
        }
        
        ///Of course, the real challenge here is how you enable multiple selections, because tapping on one row will automatically unselect the previous row. iOS does have a fairly hidden gesture for activating multi-select mode: if you swipe horizontally on your data using two fingers, it will activate. If you're using the simulator, you need to hold down the Option key to enable two-finger mode, then also hold down the Shift key to enable swiping, and now swipe from left to right on the list. Although both of those work, neither are terribly obvious. A better idea is to add an EditButton, which automatically handles enabling or disabling editing and therefore also enables or disables multi-select mode.
        ///
        
        EditButton()
        
    }
}

#Preview {
    SelectionOnLists()
}
