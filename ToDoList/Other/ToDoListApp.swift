//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import FirebaseCore
import SwiftUI
import UserNotifications

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    askForNotificationPermission()
                }
        }
    }
    
    func askForNotificationPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                dispathNotification()
            case .denied:
                
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        dispathNotification()
                    } else {
                        
                    }
                }
            default:
                return
            }
        }
    }
    
    func dispathNotification() {
        let identifier = "my-morning-notification"
        let title = "Bugün Yapılacakları Unutma!"
        let body = "Kaçırmış olduğun şeyler olabilir bir göz at"
        let hour = 16
        let minute = 56
        let isDaily = true
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request)
    }
}

