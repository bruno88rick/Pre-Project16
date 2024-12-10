//
//  ContextMenus(3DTouch).swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 09/12/24.
//

import SwiftUI

struct ContextMenus_3DTouch_: View {
    @State private var backgroundColor: Color = .red
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color with Context Menu")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                        backgroundColor = .red
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                }
        }
    }
    
    ///Apple really likes these menu items to look somewhat uniform across apps, so if you were to try adding a foregroundStyle() modifier to the above code it would be ignore – trying to color menu items randomly just won’t work. If you really want that item to appear red, which as you should know means destructive, you should use a button role instead.
    /*
    I have a few tips for you when working with context menus, to help ensure you give your users the best experience:
    
    If you’re going to use them, use them in lots of places – it can be frustrating to press and hold on something only to find nothing happens.
    Keep your list of options as short as you can – aim for three or less.
    Don’t repeat options the user can already see elsewhere in your UI.
    Remember, context menus are by their nature hidden, so please think twice before hiding important actions in a context menu.
    */
}

#Preview {
    ContextMenus_3DTouch_()
}
