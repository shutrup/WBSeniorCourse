//
//  AnyContainer.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 20.07.2024.
//

import Foundation

class AnyContainer<T>: Container {
    typealias Item = T

    private let _append: (T) -> Void
    private let _remove: () -> T?

    init<C: Container>(_ container: C) where C.Item == T {
        var container = container
        _append = { item in container.append(item) }
        _remove = { container.remove() }
    }

    func append(_ item: T) {
        _append(item)
    }

    func remove() -> T? {
        return _remove()
    }
}
