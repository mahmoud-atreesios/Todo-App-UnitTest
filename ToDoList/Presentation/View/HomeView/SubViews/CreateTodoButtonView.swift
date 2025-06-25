//
//  CreateTodoButtonView.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 02/06/2025.
//

import SwiftUI

struct CreateTodoButtonView: View {
    
    var onCreateTodo: (() -> Void)?
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    if let onCreateTodo = onCreateTodo {
                        onCreateTodo()
                    }
                    print("create new todo button")
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(
                            Color.buttonColor
                        )
                        .clipShape(Circle())
                }
            }
            .padding()
        }
        .padding()
        
    }
}

#Preview {
    CreateTodoButtonView()
}
