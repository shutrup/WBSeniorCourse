//
// Weather.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct Weather: Codable, JSONEncodable, Hashable {

    /** Weather condition id */
    public var id: Int?
    /** Group of weather parameters (Rain, Snow, Extreme etc.) */
    public var main: String?
    /** Weather condition within the group */
    public var description: String?
    /** Weather icon id */
    public var icon: String?

    public init(id: Int? = nil, main: String? = nil, description: String? = nil, icon: String? = nil) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case main
        case description
        case icon
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(main, forKey: .main)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(icon, forKey: .icon)
    }
}

