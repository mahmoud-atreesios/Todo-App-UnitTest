//
//  UpdateTaskUsecase.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 23/06/2025.
//

import Foundation

class UpdateTaskUsecase {
    private var todoRepository: TodoRepo
    
    init(todoRepository: TodoRepo) {
        self.todoRepository = todoRepository
    }
}

// MARK: - Update function
extension UpdateTaskUsecase {
    func updateTodoTask(todo: Todo) {
        todoRepository.update(todo)
    }
}
