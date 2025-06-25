//
//  CreateNewTaskUsecase.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation

class CreateNewTaskUsecase {
    private var todoRepository: TodoRepo
    
    init(todoRepository: TodoRepo) {
        self.todoRepository = todoRepository
    }
    
    // MARK: - Create new task
    func createNewTask(title: String, date: Date, time: Date, activities: [TaskActivity]) {
        todoRepository.createNewTodoTask(todo: Todo(id: UUID(), title: title, date: date, time: time, activities: activities))
    }
}
