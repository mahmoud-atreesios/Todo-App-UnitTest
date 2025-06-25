//
//  TaskActivity.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 16/06/2025.
//

import Foundation

struct TaskActivity: Identifiable, Codable, Hashable {
    let id: UUID
    var title: String
    var isDone: Bool

    init(id: UUID = UUID(), title: String, isDone: Bool = false) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
}
