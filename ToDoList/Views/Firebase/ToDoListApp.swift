//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import FirebaseCore
import SwiftUI
import UserNotifications
import IQKeyboardManagerSwift

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
                    IQKeyboardManager.shared.enableAutoToolbar = true
                    IQKeyboardManager.shared.shouldResignOnTouchOutside = true
                    
                    
                }
        }
    }
    
    //MARK: - Notification Permissios and Dispatch
    func askForNotificationPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                dispatchNotificationTwiceDaily()
            case .denied:
                
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        dispatchNotificationTwiceDaily()
                    } else {
                        
                    }
                }
            default:
                return
            }
        }
    }
    
    func dispatchNotificationTwiceDaily() {
        let identifier = "my-morning-notification"
        let title = "Check Out What To Do Today!"
        let title2 = "Don't Forget What To Do in The Evening!"
        let body = "There might be something you missed, take a look"
        let firstHour = 9
        let firstMinute = 0
        let secondHour = 17
        let secondMinute = 10
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        let content2 = UNMutableNotificationContent()
        
        content.title = title
        content2.title = title2
        content.body = body
        content2.body = body
        content.sound = .default
        content2.sound = .default
        
        
        var firstDateComponents = DateComponents()
        firstDateComponents.hour = firstHour
        firstDateComponents.minute = firstMinute
        let firstTrigger = UNCalendarNotificationTrigger(dateMatching: firstDateComponents, repeats: true)
        let firstRequest = UNNotificationRequest(identifier: identifier + "-morning", content: content, trigger: firstTrigger)
        
        var secondDateComponents = DateComponents()
        secondDateComponents.hour = secondHour
        secondDateComponents.minute = secondMinute
        let secondTrigger = UNCalendarNotificationTrigger(dateMatching: secondDateComponents, repeats: true)
        let secondRequest = UNNotificationRequest(identifier: identifier + "-evening", content: content2, trigger: secondTrigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier + "-morning", identifier + "-evening"])
        notificationCenter.add(firstRequest)
        notificationCenter.add(secondRequest)
    }
}

