//
//  ContentView.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 01/06/2025.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var coordinator: MainAppCoordinator
    @StateObject var viewModel: HomeViewModel
    
    @State private var selectedTodoNumber: Int? = nil
    @State private var selectedTodo: Todo?
    
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            
            // Background
            Rectangle()
                .fill(Color.backgroundColor)
                .ignoresSafeArea()
            
            // Content
            content()
            
            // Create todo button
            createButton()
            
            // Show expanded view only when it tapped
            expandedView()
            
        }
        .animation(.easeInOut, value: selectedTodoNumber)
        .onAppear {
            print(viewModel.fetchAllTasks())
            print(viewModel.fetchAllTasks().count)
        }
    }
}

// MARK: - Content
extension HomeView {
    private func content() -> some View {
        ScrollView(content: {
            VStack {
                // Nav Bar view
                NavBarView()
                
                // Todo title
                toDoTitle()
                
                // Todo lists
                toDolistsView()
                
                Spacer()
            }
            .padding()
        })
    }
}

// MARK: - Todo title view
extension HomeView {
    private func toDoTitle() -> some View {
        HStack {
            Text("To Do List")
                .font(.system(size: 25))
                .foregroundColor(.textColor)
                .bold()
                .padding(.vertical, 10)
            Spacer()
        }
    }
}

// MARK: - Todo lists grid view
extension HomeView {
    private func toDolistsView() -> some View {
        let tasks = viewModel.fetchAllTasks()
        let rows = stride(from: 0, to: tasks.count, by: 2).map { index -> [Todo] in
            let end = min(index + 2, tasks.count)
            return Array(tasks[index..<end])
        }

        return Grid {
            ForEach(rows.indices, id: \.self) { rowIndex in
                GridRow {
                    ForEach(rows[rowIndex], id: \.id) { todo in
                
                        ToDoListView(id: todo.id.hashValue, namespace: animation, todo: todo) {
                            withAnimation(.easeInOut) {
                                selectedTodoNumber = todo.id.hashValue
                                selectedTodo = todo
                            }
                        } onTaskActivityPressed: { todo in
                            viewModel.updateTask(todo: todo)
                            if let refreshedTodo = viewModel.fetchAllTasks().first(where: { $0.id == todo.id }) {
                                selectedTodo = refreshedTodo
                            }
                        }
                    }
                    
                    // Fill in empty column if last row has only 1 item
                    if rows[rowIndex].count == 1 {
                        Color.clear
                    }
                }
            }
        }
    }
}

// MARK: - Show expanded view only when it tapped
extension HomeView {
    private func expandedView() -> some View {
        VStack {
            if let selected = selectedTodoNumber, let selectedTodo = selectedTodo {
                
                ExpandedView(id: selected, namespace: animation, todo: selectedTodo, onClose: {
                    withAnimation(.easeInOut) {
                        selectedTodoNumber = nil
                    }
                }, onDelete: {
                    viewModel.deleteTask(todo: selectedTodo)
                    selectedTodoNumber = nil
                })
                
                .padding(5)
            }
        }
    }
}

// MARK: - Create Button
extension HomeView {
    private func createButton() -> some View {
        CreateTodoButtonView {
            coordinator.goToCreateTodoView()
        }
    }
}

// MARK: - Preview
//#Preview {
//    HomeView()
//}
