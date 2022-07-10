//
//  NewEvent.swift
//  spike
//
//  Created by victor kabike on 2022/07/05.
//

import SwiftUI
import CoreData

struct NewEvent: View {
    @EnvironmentObject var events: EventsViewModel 
    @Environment(\.self) var env
    var body: some View {
        NavigationStack{
            VStack(alignment: .center,spacing: 20){
                Section{
                    Group{
                        TextField("Title", text: $events.title)
                        TextField("About", text: $events.about)
                        TextField("location", text: $events.location)
                        
                    }.foregroundColor(.black.opacity(0.8))
                        .padding(.horizontal)
                        .padding(.vertical,12)
                        .background(Color(uiColor: .systemGray5), in: RoundedRectangle(cornerRadius: 8))
                }
                Divider()
                Section{
                    DatePicker("Date", selection: $events.date,displayedComponents: .date)
                    DatePicker("Start Time", selection: $events.startTime,displayedComponents: .hourAndMinute)
                    DatePicker("End Time", selection: $events.endTime,displayedComponents: .hourAndMinute)
                    Toggle(isOn: $events.isReminderOn) {
                        Text("Set a Reminder")
                    }
                    
                }
                Divider()
                Section{
                    Button {
                        if  events.newEvent(context: env.managedObjectContext){
                            env.dismiss()
                        }
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding(.horizontal,178)
                            .padding(.vertical,12)
                            .background(Color(uiColor: .systemGreen), in: RoundedRectangle(cornerRadius: 8))
                            .disabled(events.saveStatus())
                    }
                    
                }.frame(maxWidth: .infinity)
                Spacer()
                
            }
            .padding()
            .navigationTitle("Add Event")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        env.dismiss()
                        
                    } label: {
                        Text("Cancel")
                    }

                }
            }
        }
    }
}

struct NewEvent_Previews: PreviewProvider {
    static var previews: some View {
        NewEvent()
    }
}
