//
//  Todo.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 03/06/2025.
//

import Foundation

struct Todo: Identifiable {
    let id: UUID
    let title: String
    let date: Date
    let time: Date
    var activities: [TaskActivity]
}
