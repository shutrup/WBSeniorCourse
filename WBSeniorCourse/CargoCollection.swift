//
//  CargoCollection.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 27.07.2024.
//

import Foundation

class CargoCollection: ObservableObject {
    @Published private var items: [Cargo] = []

    func add(_ cargo: Cargo) {
        items.append(cargo)
    }

    subscript(index: Int) -> Cargo? {
        guard index >= 0 && index < items.count else {
            return nil
        }
        return items[index]
    }

    var count: Int {
        return items.count
    }
}

infix operator +++

func +++ (lhs: Cargo, rhs: Cargo) -> Double {
    return lhs.volume + rhs.volume
}
