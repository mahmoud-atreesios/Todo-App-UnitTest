//
//  CoreDataStorageManagerProtocol.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation
import CoreData

// MARK: - Core Data Crud operations
protocol CoreDataStorageManagerProtocol {
    func create<T: NSManagedObject>(_: T.Type, configure: (T) -> Void)
    func read<T: NSManagedObject>(with request: NSFetchRequest<T>) -> [T]
    func update(_ object: NSManagedObject, updates: () -> Void)
    func delete(_ object: NSManagedObject)
}
