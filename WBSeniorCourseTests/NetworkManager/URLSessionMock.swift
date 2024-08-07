//
//  URLSessionMock.swift
//  WBSeniorCourseTests
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import Foundation
@testable import WBSeniorCourse

class URLSessionMock: URLSessionProtocol {
    private let data: Data?
    private let response: URLResponse?
    private let error: Error?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        
        guard let data = data, let response = response else {
            throw NetworkError.requestFailed
        }
        
        return (data, response)
    }
}
