//
//  CreateTodoView.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 02/06/2025.
//

import SwiftUI

struct CreateTodoView: View {
    
    @EnvironmentObject var coordinator: MainAppCoordinator
    @StateObject var viewModel: CreateTodoViewModel
    
    @State private var taskTitle: String = ""
    @State private var taskDate: Date = Date()
    @State private var taskTime: Date = Date()
    @State var tasks: [TaskActivity] = []
    
    var body: some View {
        ZStack {
            
            // Background
            Rectangle()
                .fill(Color.backgroundColor)
                .ignoresSafeArea()
            
            // Content of the screen
            content()
            
        }
        .navigationBarBackButtonHidden(true)
//        .onAppear {
//            print(viewModel.createNewTaskUsecase.fetchAllTasks())
//        }
    }
}

// MARK: - Content
extension CreateTodoView {
    private func content() -> some View {
        VStack(alignment: .leading) {
            
            // navigation bar
            navBar()
            
            ScrollView(showsIndicators: false) {
                
                // task title
                taskTitleView()
                
                // date and time
                HStack {
                    chooseTaskDate()
                    Spacer()
                    chooseTaskTime()
                }
                .padding(.bottom)
                
                // task activity
                TaskActivityView(tasks: $tasks)
                
            }
            
            addNewTaskButton()
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

// MARK: - NavBar view
extension CreateTodoView {
    private func navBar() -> some View {
        
        HStack {
            Button {
                print("Back Button")
                coordinator.pop()
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 10, height: 12)
                    .bold()
                    .padding(10)
                    .foregroundStyle(Color.textColor)
                    .background(Color.searchColor)
                    .clipShape(Circle())
            }
            Spacer()
            
            Text("Create a new task")
                .font(.system(size: 22))
                .foregroundColor(.textColor)
                .bold()
                .padding(.trailing, 20)
            
            Spacer()
        }
    }
}

// MARK: - Task title
extension CreateTodoView {
    private func taskTitleView() -> some View {
        VStack(alignment: .leading) {
            Text("Task title")
                .font(.system(size: 22))
                .foregroundColor(.textColor)
                .bold()
            
            TextField(text: $taskTitle) {
                HStack {
                    Text("Write here")
                        .font(.system(size: 16))
                        .foregroundStyle(Color.gray)
                        .bold()
                }
            }
            .foregroundStyle(Color.gray)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.searchColor)
            )
            
        }
        .padding(.vertical)
    }
}

// MARK: - Choose Date
extension CreateTodoView {
    private func chooseTaskDate() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Date")
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.textColor)
            
            DatePicker("", selection: $taskDate, displayedComponents: [.date])
                .datePickerStyle(.compact)
                .labelsHidden()
                .background(Color.searchColor)
                .cornerRadius(10)
                .accentColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

// MARK: - Choose Time
extension CreateTodoView {
    private func chooseTaskTime() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Time")
                .font(.system(size: 18))
                .bold()
                .foregroundColor(.textColor)
            
            DatePicker("", selection: $taskTime, displayedComponents: [.hourAndMinute])
                .datePickerStyle(.compact)
                .labelsHidden()
                .background(Color.searchColor)
                .cornerRadius(10)
                .accentColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

// MARK: - Add new task button
extension CreateTodoView {
    private func addNewTaskButton() -> some View {
        HStack {
            Spacer()
            Button {
                print("add new task button pressed")
                viewModel.createNewTodoTask(title: taskTitle, date: taskDate, time: taskTime, activities: tasks)
                coordinator.pop()
            } label: {
                Text("Add New Task")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(Color.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.buttonColor)
                    )
            }
            Spacer()
        }
    }
}


// MARK: - Preview
#Preview {
    let mockStorageManager = CoreDataStorageManager.shared
    let dataSource = LocalTodoDataSource(coreDataStorageManager: mockStorageManager)
    let repo = TodoRepo(localDataSource: dataSource)
    let usecase = CreateNewTaskUsecase(todoRepository: repo)
    let viewModel = CreateTodoViewModel(createNewTaskUsecase: usecase)
    
    CreateTodoView(viewModel: viewModel)
        .environmentObject(MainAppCoordinator())
}
