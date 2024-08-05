//
//  Endpoint.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var queryParameters: [String: String]? { get }
}

extension Endpoint {
    var url: URL {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        components.path = path
        if let queryParameters = queryParameters {
            components.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        return components.url!
    }
}

