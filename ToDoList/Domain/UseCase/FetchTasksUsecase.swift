//
//  FetchTasksUsecase.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation

class FetchTasksUsecase {
    private var todoRepository: TodoRepo
    
    init(todoRepository: TodoRepo) {
        self.todoRepository = todoRepository
    }
}

// MARK: - Fetch all tasks
extension FetchTasksUsecase {
    func fetchAllTasks() -> [Todo] {
        todoRepository.fetchAllTodoTasks()
    }
}
