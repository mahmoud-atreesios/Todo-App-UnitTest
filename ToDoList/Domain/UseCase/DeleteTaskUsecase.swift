//
//  DeleteTaskUsecase.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 23/06/2025.
//

import Foundation

class DeleteTaskUsecase {
    private var todoRepository: TodoRepo
    
    init(todoRepository: TodoRepo) {
        self.todoRepository = todoRepository
    }
}

// MARK: - Delete tasks i will remove it later from here
extension DeleteTaskUsecase {
    func deleteTask(todo: Todo) {
        todoRepository.delete(todo)
    }
}
