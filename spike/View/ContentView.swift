//
//  ContentView.swift
//  spike
//
//  Created by victor kabike on 2022/07/01.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Events.date, ascending: true)],
//        animation: .default)
//    private var events: FetchedResults<Events>

    var body: some View {
        NavigationStack{
            ScrollView{
               EventList()
                    
            }
           
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
