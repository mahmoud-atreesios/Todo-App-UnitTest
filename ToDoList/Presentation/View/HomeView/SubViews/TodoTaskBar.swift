//
//  TodoTaskBar.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 04/06/2025.
//

import SwiftUI

struct TodoTaskBar: View {
    
    @State var todoItem: Todo
    
    var onTaskActivityPressed: ((Todo) -> Void)?
    
    var body: some View {
        ForEach(todoItem.activities.indices, id: \.self) { index in
            let activity = todoItem.activities[index]

            HStack {
                Button {
                    // Toggle isDone
                    todoItem.activities[index].isDone.toggle()
                    print("✅ Activity '\(activity.title)' toggled in Todo '\(todoItem.title)' [id: \(todoItem.id)]")
                    
                    // Notify parent with updated todo
                    onTaskActivityPressed?(todoItem)
                } label: {
                    if activity.isDone {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(Color.gray)
                    } else {
                        Image(systemName: "circle")
                            .foregroundStyle(Color.white)
                    }
                    Text(activity.title)
                        .font(.system(size: 12))
                        .foregroundStyle(activity.isDone ? .gray : .white)
                }

                Spacer()
            }
            .frame(height: 20)
        }
    }
}

#Preview {
    TodoTaskBar(todoItem: Todo(id: UUID(), title: "First Task Title", date: Date(), time: Date(), activities: [TaskActivity(id: UUID(), title: "First Task Activity Title", isDone: false), TaskActivity(id: UUID(), title: "Second Task Activity Title", isDone: false)]))
}
