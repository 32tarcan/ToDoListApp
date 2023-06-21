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
        let title = "Bugün Yapılacakları Unutma!"
        let title2 = "Akşam Yapılacakları Unutma!"
        let body = "Kaçırmış olduğun şeyler olabilir bir göz at"
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
        
        let calendar = Calendar.current
        
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

