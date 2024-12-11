//
//  Notifications.swift
//  Pre-Project16
//
//  Created by Bruno Oliveira on 10/12/24.
//

import SwiftUI
import UserNotifications

struct LocalNotifications: View {
    var body: some View {
        VStack {
            Button("Request for Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            .padding()
            
            /*If the user grants permission, then we’re all clear to start scheduling notifications. Even though notifications might seem simple, Apple breaks them down into three parts to give it maximum flexibility:
             
             The content is what should be shown, and can be a title, subtitle, sound, image, and so on.
             The trigger determines when the notification should be shown, and can be a number of seconds from now, a date and time in the future, or a location.
             The request combines the content and trigger, but also adds a unique identifier so you can edit or remove specific alerts later on. If you don’t want to edit or remove stuff, use UUID().uuidString to get a random identifier.
             When you’re just learning notifications the easiest trigger type to use is UNTimeIntervalNotificationTrigger, which lets us request a notification to be shown in a certain number of seconds from now*/
            
            Button("Schedule a Notification") {
                
                //creating the content of the notification
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat!"
                content.subtitle = "Please feed the cat!"
                content.sound = UNNotificationSound.default
                
                //show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                //choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                //add our notification request
                UNUserNotificationCenter.current().add(request)
                
            }
            .padding()
            
        }
    }
}

#Preview {
    LocalNotifications()
}
