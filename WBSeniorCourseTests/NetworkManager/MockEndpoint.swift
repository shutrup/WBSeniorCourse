//
//  MockEndpoint.swift
//  WBSeniorCourseTests
//
//  Created by Шарап Бамматов on 05.08.2024.
//

import Foundation
@testable import WBSeniorCourse

struct MockEndpoint: Endpoint {
    var baseURL: URL
    var path: String
    var method: String
    var headers: [String: String]?
    var queryParameters: [String: String]?
}
