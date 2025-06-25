//
//  TaskActivityView.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 02/06/2025.
//

import SwiftUI

struct TaskActivityView: View {
    
    @Binding var tasks: [TaskActivity]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Task Activity")
                    .font(.system(size: 22))
                    .foregroundColor(.textColor)
                    .bold()
                Spacer()
                
                Button {
                    tasks.append(TaskActivity(id: UUID(), title: "", isDone: false))
                } label: {
                    addButtonView()
                }
            }
            
            taskTextFields()
            
        }
        .padding(.vertical)
    }
}

// MARK: - Add Button View
extension TaskActivityView {
    private func addButtonView() -> some View {
        HStack {
            Text("Add")
            Image(systemName: "plus")
        }
        .bold()
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(Color.searchColor)
        )
        .foregroundStyle(Color.text)
    }
}

// MARK: - Task Activity Text Fields
extension TaskActivityView {
    private func taskTextFields() -> some View {
        VStack(spacing: 10) {
            ForEach(tasks.indices, id: \.self) { index in
                HStack {
                    TextField(text: $tasks[index].title) {
                        HStack {
                            Text("Write your task")
                                .font(.system(size: 16))
                                .bold()
                        }
                        .foregroundStyle(Color.gray)
                    }
                    .padding(10)
                    .foregroundStyle(Color.gray)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.searchColor)
                    )
                    
                    Button {
                        tasks.remove(at: index)
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.buttonColor)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(.top, 10)
    }
}

// MARK: - Preview
//#Preview {
//    TaskActivityView()
//}
