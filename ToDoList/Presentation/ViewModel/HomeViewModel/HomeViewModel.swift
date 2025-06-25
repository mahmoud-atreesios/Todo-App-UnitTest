//
//  HomeViewModel.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 04/06/2025.
//

import Foundation

class HomeViewModel: ObservableObject {
    private var fetchTasksUsecase: FetchTasksUsecase
    private var updateTaskUsecase: UpdateTaskUsecase
    private var deleteTaskUsecase: DeleteTaskUsecase
    
    init(fetchTasksUsecase: FetchTasksUsecase, updateTaskUsecase: UpdateTaskUsecase, deleteTaskUsecase: DeleteTaskUsecase) {
        self.fetchTasksUsecase = fetchTasksUsecase
        self.updateTaskUsecase = updateTaskUsecase
        self.deleteTaskUsecase = deleteTaskUsecase
    }
}

// MARK: - Fetch All tasks
extension HomeViewModel {
    func fetchAllTasks() -> [Todo] {
        fetchTasksUsecase.fetchAllTasks()
    }
}

// MARK: - Update Tasks
extension HomeViewModel {
    func updateTask(todo: Todo) {
        updateTaskUsecase.updateTodoTask(todo: todo)
    }
}

// MARK: - Delete Tasks
extension HomeViewModel {
    func deleteTask(todo: Todo) {
        deleteTaskUsecase.deleteTask(todo: todo)
    }
}
