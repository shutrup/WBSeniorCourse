//
//  Cargo.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 27.07.2024.
//

import Foundation

struct Cargo {
    var width: Double
    var height: Double
    var depth: Double
    
    var volume: Double {
        return width * height * depth
    }
}
