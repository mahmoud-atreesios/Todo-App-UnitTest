//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 01/06/2025.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var appCoordinator = AppCoordinator()
    @StateObject var mainAppCoordinator = MainAppCoordinator()

    var body: some Scene {
        WindowGroup {
            switch appCoordinator.currentFlow {
            case .mainApp:
                MainAppView()
                    .environmentObject(appCoordinator)
                    .environmentObject(mainAppCoordinator)
            }
        }
    }
}

