//
//  MainAppCoordinator.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 02/06/2025.
//

import Foundation

class MainAppCoordinator: ObservableObject {
    @Published var path: [Route] = []
    
    enum Route {
        case CreateTodoView
    }
    
    func goToCreateTodoView() {
        path.append(.CreateTodoView)
    }
    
    func pop() {
        _ = path.popLast()
    }

    func reset() {
        path = []
    }
}

// MARK: - Factory Method that is responsiable for creating the home view model object
extension MainAppCoordinator {
    func makeHomeViewModel() -> HomeViewModel {
        let coreDataStorageManager = CoreDataStorageManager.shared
        let localDataSource = LocalTodoDataSource(coreDataStorageManager: coreDataStorageManager)
        let repository = TodoRepo(localDataSource: localDataSource)
        let fetchUseCase = FetchTasksUsecase(todoRepository: repository)
        let updateTaskUsecase = UpdateTaskUsecase(todoRepository: repository)
        let deleteTaskUsecase = DeleteTaskUsecase(todoRepository: repository)
        return HomeViewModel(fetchTasksUsecase: fetchUseCase, updateTaskUsecase: updateTaskUsecase, deleteTaskUsecase: deleteTaskUsecase)
    }
}

// MARK: - Factory Method that is responsiable for creating the create todo view model object
extension MainAppCoordinator {
    func makeCreateTodoViewModel() -> CreateTodoViewModel {
        let coreDataStorageManager = CoreDataStorageManager.shared
        let localDataSource = LocalTodoDataSource(coreDataStorageManager: coreDataStorageManager)
        let repository = TodoRepo(localDataSource: localDataSource)
        let useCase = CreateNewTaskUsecase(todoRepository: repository)
        return CreateTodoViewModel(createNewTaskUsecase: useCase)
    }
}
