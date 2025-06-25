//
//  LocalDataSourceProtocol.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation
import CoreData

protocol LocalTodoDataSourceProtocol {
    
    func createNewTodoTask<T: NSManagedObject>(entityType: T.Type, configure: (T) -> Void)
    func fetchTodoTask<T: NSManagedObject>(with request: NSFetchRequest<T>) -> [T]
    func updateTodoTask(object: NSManagedObject, updates: () -> Void)
    func deleteTodoTask(object: NSManagedObject)
    
}
