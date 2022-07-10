//
//  EventList.swift
//  spike
//
//  Created by victor kabike on 2022/07/03.
//

import SwiftUI

struct EventList: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Events.date, ascending: true)],
        animation: .default)
    private var eventData: FetchedResults<Events>
    @Environment(\.self) var env
    @StateObject var events: EventsViewModel = .init()
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(eventData) { event in
                        EventDetail(event: event)
                            .swipeActions(edge: .leading) {
                                Button {
                                    env.managedObjectContext.delete(event)
                                    try? env.managedObjectContext.save()
                                } label: {
                                    Image(systemName: "trash")
                                }

                            }
                        
                    }
                }.listStyle(.plain)
                    
                

            }.navigationTitle("Events")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "bell.fill")
                                .font(.caption)
                                .padding(10)
                                .foregroundColor(.white)
                                .background(Color(uiColor: .systemGreen), in: Circle())
                        }

                    }
                    
                }
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        events.addNewEvent.toggle()
                    
                    } label: {
                        Label {
                            Text("Add Event")
                        } icon: {
                            Image(systemName: "plus.app.fill")
                        }

                    }
                    .padding(.horizontal)
                    .padding(.vertical,12)
                    .foregroundColor(Color(uiColor: .systemBlue))
                    .buttonStyle(.bordered)
                    
                    
                        
                }.padding()
                .fullScreenCover(isPresented: $events.addNewEvent) {
                    events.resetEvents()
                   
                } content: {
                    NewEvent().environmentObject(events)
                }

            
        }
        
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
