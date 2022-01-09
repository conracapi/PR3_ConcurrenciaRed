//
//  CategoriesDetailRequest.swift
//  DiscourseClient
//
//  Created by Conrado Capilla García on 6/1/22.
//

import Foundation

struct CategoriesDetailRequest: APIRequest {
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    typealias Response = CategoryDetailResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/c/\(id)/show.json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
}
