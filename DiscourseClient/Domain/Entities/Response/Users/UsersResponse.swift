//
//  UsersResponse.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

struct UsersResponse: Codable {
    let directoryItems: [DirectoryItem]

    enum CodingKeys: String, CodingKey {
        case directoryItems = "directory_items"
    }
}

struct DirectoryItem: Codable {
    let user: User
}
