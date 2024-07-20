//
//  Container.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 20.07.2024.
//

import Foundation

protocol Container {
    associatedtype Item

    mutating func append(_ item: Item)
    mutating func remove() -> Item?
}

extension Stack: Container {
    typealias Item = Element

    mutating func append(_ item: Element) {
        push(item)
    }

    mutating func remove() -> Element? {
        return pop()
    }
}

extension Queue: Container {
    typealias Item = Element

    func append(_ item: Element) {
        enqueue(item)
    }

    func remove() -> Element? {
        return dequeue()
    }
}

func makeOpaqueContainer<T>(with item: T) -> some Container {
    var stack = Stack<T>()
    stack.append(item)
    return stack
}
