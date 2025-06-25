//
//  LocalDataSource.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation
import CoreData

class LocalTodoDataSource {
    var coreDataStorageManager: CoreDataStorageManagerProtocol
    
    init(coreDataStorageManager: CoreDataStorageManagerProtocol) {
        self.coreDataStorageManager = coreDataStorageManager
    }    
}

// MARK: - Create new todo task
extension LocalTodoDataSource {
    func createNewTodoTask<T: NSManagedObject>(entityType: T.Type, configure: (T) -> Void) {
        coreDataStorageManager.create(entityType, configure: configure)
    }
}

// MARK: - Fetch all tasks
extension LocalTodoDataSource {
    var fetchTodoTask: [TodoTask] {
        let request: NSFetchRequest<TodoTask> = TodoTask.fetchRequest()
        return coreDataStorageManager.read(with: request)
    }
}

// MARK: - Fetch task by id
extension LocalTodoDataSource {
    func fetch(by id: UUID) -> TodoTask? {
        let request: NSFetchRequest<TodoTask> = TodoTask.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        request.fetchLimit = 1
        return coreDataStorageManager.read(with: request).first
    }
}

// MARK: - Update existing task
extension LocalTodoDataSource {
    func update(_ object: NSManagedObject, updates: () -> Void) {
        coreDataStorageManager.update(object, updates: updates)
    }
}

// MARK: - Delete task
extension LocalTodoDataSource {
    func delete(_ object: NSManagedObject) {
        coreDataStorageManager.delete(object)
    }
}
