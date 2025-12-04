//
//  CoreDataStack.swift
//  CoreDataDemo
//
//  Created by Tihitinaw Buzuwek on 29/10/2025.
//

import Foundation
import CoreData

final class CoreDataStack {
    static let shared = CoreDataStack(modelName: "PatientManagementSystem")

    let persistentContainer: NSPersistentContainer

    private init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
        persistentContainer.loadPersistentStores { storeDesc, error in
            if let error = error as NSError? {
                fatalError("Unresolved error loading store: \(error), \(error.userInfo)")
            }
        }
    
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func newBackgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }

    func saveContext(context: NSManagedObjectContext? = nil) {
        let ctx = context ?? viewContext
        if ctx.hasChanges {
            do {
                try ctx.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error saving context: \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
