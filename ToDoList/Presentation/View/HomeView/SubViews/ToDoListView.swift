//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 01/06/2025.
//

import SwiftUI

struct ToDoListView: View {
    var id: Int
    var namespace: Namespace.ID
    var todo: Todo
    var onExpand: (() -> Void)?
    
    var onTaskActivityPressed: ((Todo) -> Void)?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .matchedGeometryEffect(id: id, in: namespace)
                .frame(width: 180, height: 150)
                .foregroundStyle(Color.itemBackgroundColor)
                .onTapGesture {
                    onExpand?()
                }
            
            shrinkedView()
        }
    }
}

// MARK: - Shrinked view
extension ToDoListView {
    private func shrinkedView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(todo.title)
                    .font(.system(size: 15))
                    .foregroundStyle(Color.textColor)
                    .bold()
                Spacer()
            }
            
            HStack {
                Text("\(todo.time.formattedTime()) pm")
                    .font(.system(size: 12))
                    .foregroundStyle(Color.textColor)
                    .bold()
                Spacer()
            }
            
            TodoTaskBar(todoItem: todo, onTaskActivityPressed: onTaskActivityPressed)

            Spacer()
        }
        .padding(12)
        .frame(width: 180, height: 150)
    }
}

// MARK: - Preview
#Preview {
    struct PreviewWrapper: View {
        @Namespace var animation
        
        var body: some View {
            ToDoListView(id: 1, namespace: animation, todo: Todo(id: UUID(), title: "First Title", date: Date(), time: Date(), activities: [TaskActivity(id: UUID(), title: "First Task Activity Title", isDone: false), TaskActivity(id: UUID(), title: "Second Task Activity Title", isDone: false)]))
        }
    }
    
    return PreviewWrapper()
}
