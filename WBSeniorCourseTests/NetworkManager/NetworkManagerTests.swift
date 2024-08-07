//
//  NetworkManagerTests.swift
//  WBSeniorCourseTests
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import XCTest
@testable import WBSeniorCourse

class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManagerProtocol!
    var sessionMock: URLSessionMock!
    
    override func setUpWithError() throws {
        // Setup code here.
    }

    override func tearDownWithError() throws {
        // Teardown code here.
    }
    
    func testSuccessfulRequest() async throws {
        let data = "{\"key\":\"value\"}".data(using: .utf8)
        let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        sessionMock = URLSessionMock(data: data, response: response, error: nil)
        networkManager = NetworkManager(urlSession: sessionMock)
        
        let endpoint = MockEndpoint(baseURL: URL(string: "https://example.com")!,
                                    path: "/test",
                                    method: "GET",
                                    headers: nil,
                                    queryParameters: nil)
        
        let result: [String: String] = try await networkManager.request(endpoint)
        XCTAssertEqual(result["key"], "value")
    }
    
    func testRequestWithFailure() async throws {
        let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 500, httpVersion: nil, headerFields: nil)
        sessionMock = URLSessionMock(data: nil, response: response, error: NetworkError.requestFailed)
        networkManager = NetworkManager(urlSession: sessionMock)
        
        let endpoint = MockEndpoint(baseURL: URL(string: "https://example.com")!,
                                    path: "/test",
                                    method: "GET",
                                    headers: nil,
                                    queryParameters: nil)
        
        do {
            let _: [String: String] = try await networkManager.request(endpoint)
            XCTFail("Expected failure response")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.requestFailed)
        }
    }
}
