//
//  MainAppView.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 02/06/2025.
//

import SwiftUI

struct MainAppView: View {
    @EnvironmentObject var coordinator: MainAppCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView(viewModel: coordinator.makeHomeViewModel())
                .navigationDestination(for: MainAppCoordinator.Route.self) { route in
                    switch route {
                    case .CreateTodoView:
                        CreateTodoView(viewModel: coordinator.makeCreateTodoViewModel())
                    }
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}
