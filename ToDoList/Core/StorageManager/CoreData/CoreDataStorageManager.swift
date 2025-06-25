//
//  CoreDataStorageManager.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation
import CoreData

class CoreDataStorageManager: CoreDataStorageManagerProtocol {
    
    static let shared = CoreDataStorageManager()
    
    private let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
}

// MARK: - Create function
extension CoreDataStorageManager {
    func create<T: NSManagedObject>(_: T.Type, configure: (T) -> Void) {
        let newObject = T(context: context)
        configure(newObject)
        
        saveContext()
    }
}

// MARK: - Read function
extension CoreDataStorageManager {
    func read<T: NSManagedObject>(with request: NSFetchRequest<T>) -> [T] {
        do {
            return try context.fetch(request)
        } catch {
            print("❌ Core Data fetch error: \(error)")
            return []
        }
    }
}

// MARK: - Update function
extension CoreDataStorageManager {
    func update(_ object: NSManagedObject, updates: () -> Void) {
        updates()
        saveContext()
    }
}

// MARK: - Delete function
extension CoreDataStorageManager {
    func delete(_ object: NSManagedObject) {
        context.delete(object)
        saveContext()
    }
}

// MARK: - Save context function
extension CoreDataStorageManager {
    private func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("❌ Core Data save error: \(error)")
        }
    }
}
