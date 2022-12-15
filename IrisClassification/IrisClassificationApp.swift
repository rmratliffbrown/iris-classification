//
//  IrisClassificationApp.swift
//  IrisClassification
//
//  Created by Rashaad Ratliff-Brown on 12/14/22.
//

import SwiftUI

@main
struct IrisClassificationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
