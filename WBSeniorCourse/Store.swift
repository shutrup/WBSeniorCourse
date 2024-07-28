//
//  Store.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 28.07.2024.
//

import Foundation

final class Store<State, Action>: ObservableObject {
    typealias Reducer = (State, Action) -> State

    @Published private(set) var state: State
    private let reducer: Reducer

    init(initialState: State, reducer: @escaping Reducer) {
        self.state = initialState
        self.reducer = reducer
    }

    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
