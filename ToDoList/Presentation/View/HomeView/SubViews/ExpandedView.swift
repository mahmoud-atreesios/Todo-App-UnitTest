//
//  ExpandedView.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 02/06/2025.
//

import SwiftUI

struct ExpandedView: View {
    
    var id: Int
    var namespace: Namespace.ID
    let todo: Todo
    var onClose: (() -> Void)?
    var onDelete: (() -> Void)?
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .matchedGeometryEffect(id: id, in: namespace)
                .foregroundStyle(Color.itemBackgroundColor)
            
            VStack {
                
                backButton()
                
                Spacer()
                
                content()
                
                Spacer()
            }
        }
        .padding(5)
    }
}

// MARK: - Content
extension ExpandedView {
    private func content() -> some View {
        VStack {
            
            // task details title
            taskDetailsTitle()
            
            // task title
            taskTitle()
            
            // task time
            taskTime()
            
            // task activities
            taskActivities()
            
            // delete todo button
            deleteTodoButton()
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

// MARK: - Task Details
extension ExpandedView {
    private func taskDetailsTitle() -> some View {
        VStack {
            Text("Task details")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(Color.textColor)
        }
    }
}

// MARK: - Task Title
extension ExpandedView {
    private func taskTitle() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Task title")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(Color.textColor)
                    .padding(.vertical,1)
                
                Text(todo.title)
                    .font(.system(size: 20))
                    .foregroundStyle(Color.textColor)
            }
            Spacer()
        }
    }
}

// MARK: - Task Time
extension ExpandedView {
    private func taskTime() -> some View {
        VStack(alignment: .leading) {
            Text("Task Time")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(Color.textColor)
                .padding(.vertical,5)

            HStack {
                Image(systemName: "clock")
                Text("\(todo.date)")
                Spacer()
            }
        }
    }
}

// MARK: - Task Activities
extension ExpandedView {
    private func taskActivities() -> some View {
        VStack(alignment: .leading) {
            
            Text("Task Activities")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(Color.textColor)
                .padding(.vertical,5)
            
            ForEach(todo.activities) { activity in
                HStack {
                    Text(activity.title)
                        .font(.system(size: 17, weight: .medium))
                        .foregroundStyle(activity.isDone ? Color.gray : Color.textColor)
                        .strikethrough(activity.isDone, color: .gray)
                        .padding(.vertical, 1)
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Delete Todo Button
extension ExpandedView {
    private func deleteTodoButton() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    onDelete?()
                }) {
                    
                    Image(systemName: "trash.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .tint(Color.red)
                }
            }
        }
        .padding()
    }
}

// MARK: - Back Button
extension ExpandedView {
    func backButton() -> some View {
        HStack {
            Spacer()
            Button {
                if let onClose = onClose {
                    onClose()
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.textColor)
                    .padding()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    struct PreviewWrapper: View {
        @Namespace var animation
        
        var body: some View {
            ExpandedView(id: 1, namespace: animation, todo: Todo(id: UUID(), title: "First Task Title", date: Date(), time: Date(), activities: [TaskActivity(id: UUID(), title: "First Task Activity Title", isDone: true), TaskActivity(id: UUID(), title: "Second Task Activity Title", isDone: false)]))
        }
    }
    
    return PreviewWrapper()
}

