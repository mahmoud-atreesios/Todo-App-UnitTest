//
//  CreateTodoViewModel.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation

class CreateTodoViewModel: ObservableObject {
    var createNewTaskUsecase: CreateNewTaskUsecase
    
    init(createNewTaskUsecase: CreateNewTaskUsecase) {
        self.createNewTaskUsecase = createNewTaskUsecase
    }
}

// MARK: - Create New Todo Task
extension CreateTodoViewModel {
    func createNewTodoTask(title: String, date: Date, time: Date, activities: [TaskActivity]) {
        createNewTaskUsecase.createNewTask(title: title, date: date, time: time, activities: activities)
    }
}
