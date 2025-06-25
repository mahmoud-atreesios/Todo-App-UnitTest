//
//  File.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 02/06/2025.
//

import Foundation

class AppCoordinator: ObservableObject {
    enum Flow {
//        case onboarding
//        case login
        case mainApp
    }

    @Published var currentFlow: Flow = .mainApp
}


//class AppCoordinator: ObservableObject {
//    @Published var path: [Route] = []
//    
//    enum Route: Hashable {
//        case home
//        case detail(id: Int)
//    }
//    
//    func goToHome() {
//        path = [.home]
//    }
//    
//    func goToDetail(id: Int) {
//        path.append(.detail(id: id))
//    }
//    
//    func pop() {
//        _ = path.popLast()
//    }
//}
