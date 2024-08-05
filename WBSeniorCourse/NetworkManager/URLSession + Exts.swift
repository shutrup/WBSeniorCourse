//
//  URLSession + Exts.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
