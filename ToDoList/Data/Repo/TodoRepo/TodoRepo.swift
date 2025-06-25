//
//  TodoRepo.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation
import CoreData

class TodoRepo: TodoRepoProtocol {
    
    private let localDataSource: LocalTodoDataSource

    init(localDataSource: LocalTodoDataSource) {
        self.localDataSource = localDataSource
    }
}

// MARK: - Create new task
extension TodoRepo {
    func createNewTodoTask(todo: Todo) {
        localDataSource.createNewTodoTask(entityType: TodoTask.self) { todoTask in
            todoTask.id = todo.id
            todoTask.taskTitle = todo.title
            todoTask.date = todo.date
            todoTask.time = todo.time
            todoTask.taskActivities = todo.activities
        }
    }
}

// MARK: - Fetch todo tasks
extension TodoRepo {
    func fetchAllTodoTasks() -> [Todo] {
        localDataSource.fetchTodoTask.map { task in
            Todo(
                id: task.id ?? UUID(),
                title: task.taskTitle ?? "",
                date: task.date ?? Date(),
                time: task.time ?? Date(),
                activities: task.taskActivities
            )
        }
    }
}

// MARK: - Update existing todo task
extension TodoRepo {
    func update(_ todo: Todo) {
        guard let task = localDataSource.fetch(by: todo.id) else { return }
        localDataSource.update(task) {
            task.taskTitle = todo.title
            task.date = todo.date
            task.time = todo.time
            task.taskActivities = todo.activities
        }
    }
}

// MARK: - Delete existing todo task
extension TodoRepo {
    func delete(_ todo: Todo) {
        guard let task = localDataSource.fetch(by: todo.id) else { return }
        localDataSource.delete(task)
    }
}
