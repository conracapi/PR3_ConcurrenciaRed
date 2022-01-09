//
//  ViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 20/12/21.
//

import Foundation

protocol ViewModel {}

extension ViewModel {
    var session: APIClient {
        return APIClient()
    }
}
