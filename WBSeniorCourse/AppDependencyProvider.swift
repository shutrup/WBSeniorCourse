//
//  AppDependencyProvider.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 22.08.2024.
//

import Swinject
import SwiftUI

final class AppDependencyProvider {
    static let shared = AppDependencyProvider()
    private let container: Container
    
    private init() {
        container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        container.register(AuthViewModel.self) { _ in
            AuthViewModel()
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        guard let dependency = container.resolve(T.self) else {
            fatalError("Dependency \(T.self) not resolved")
        }
        return dependency
    }
}

