//
//  UserDetailResponse.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

struct UserDetailResponse: Codable {
    let user: UserDetail
}

struct UserDetail: Codable {
    let id: Int
    let username: String
    let name: String
    let canEditName: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case name = "name"
        case canEditName = "can_edit_name"
    }
}
