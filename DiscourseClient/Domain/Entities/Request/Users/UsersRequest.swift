//
//  UsersRequest.swift
//  DiscourseClient
//
//  Created by Conrado Capilla García on 6/1/22.
//

import Foundation

struct UsersRequest: APIRequest {
    
    typealias Response = UsersResponse
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/directory_items.json"
    }
    
    var parameters: [String : String] {
        return ["period" : "all"]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
    
}
