//
//  TodoTask.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 16/06/2025.
//

import Foundation

extension TodoTask {
    var taskActivities: [TaskActivity] {
        get {
            guard let data = self.taskActivity as? Data else { return [] }
            return (try? JSONDecoder().decode([TaskActivity].self, from: data)) ?? []
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                self.taskActivity = encoded as NSData
            }
        }
    }
}

