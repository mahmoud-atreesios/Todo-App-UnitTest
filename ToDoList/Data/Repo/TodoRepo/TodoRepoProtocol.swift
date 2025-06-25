//
//  TodoRepoProtocol.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation

protocol TodoRepoProtocol {
    func createNewTodoTask(todo: Todo)
    func fetchAllTodoTasks() -> [Todo]
    func update(_ todo: Todo)
    func delete(_ todo: Todo)
}
