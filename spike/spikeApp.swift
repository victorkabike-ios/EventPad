//
//  spikeApp.swift
//  spike
//
//  Created by victor kabike on 2022/07/01.
//

import SwiftUI

@main
struct spikeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
