//
//  EventsViewModel.swift
//  spike
//
//  Created by victor kabike on 2022/07/02.
//

import Foundation
import CoreData

class EventsViewModel:  ObservableObject{
    @Published var addNewEvent: Bool = false
    
    // Mark Propetries
    
    @Published var title:String = ""
    @Published var about:String = " "
    @Published var location: String = ""
    @Published var date : Date = Date()
    @Published var startTime: Date = Date()
    @Published var endTime:Date = Date()
    @Published var notificationDate: Date = Date()
    @Published var isReminderOn: Bool = false
    
    func newEvent(context: NSManagedObjectContext) -> Bool{
        // MARK: method to add a new event
        let event = Events(context: context)
        event.title = title
        event.about = about
        event.location = location
        event.date = date
        event.startTime = startTime
        event.endTime = endTime
        event.notificationDate = notificationDate
        event.isReminderOn = isReminderOn
        if let _  = try? context.save(){
            return true
        }
        return false
    }
    func resetEvents(){
        title = ""
        about = ""
        location = ""
        date = Date()
        startTime = Date()
        endTime = Date()
        isReminderOn = false
        notificationDate = Date()
    }
    func saveStatus() -> Bool{
        if title == "" && startTime == Date() {
            return false
        }
        return true
    }
    func scheduleNotification(){
        // MARK: Method to schedule Event notification date
    }
    func removeEvent(){
        // Mark: Method to dele
    }
    
}
