//
//  Date+Extension.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 04/06/2025.
//

import Foundation

extension Date {
    func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter.string(from: self)
    }
}

