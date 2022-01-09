//
//  CategoriesResponse.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

struct CategoriesResponse: Codable {
    let categoryList: CategoryList

    enum CodingKeys: String, CodingKey {
        case categoryList = "category_list"
    }
}

struct CategoryList: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let name: String
    let color: String
    let id: Int
}
