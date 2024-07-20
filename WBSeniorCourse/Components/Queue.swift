//
//  Queue.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 20.07.2024.
//

import Foundation

class Queue<Element> {
    private var elements: [Element] = []

    func enqueue(_ element: Element) {
        elements.append(element)
    }

    func dequeue() -> Element? {
        if elements.isEmpty {
            return nil
        } else {
            return elements.removeFirst()
        }
    }
}
