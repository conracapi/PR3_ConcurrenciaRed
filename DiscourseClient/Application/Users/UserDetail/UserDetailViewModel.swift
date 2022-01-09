//
//  UserDetailViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation

final class UserDetailViewModel: ViewModel {
    
    let userName: String
    let coordinator: UserDetailCoordinator
    
    var onUserDetailSuccess: ((Int, String) -> Void)?
    var onUserDetailError: ((String) -> Void)?
    
    init(userName: String, coordinator: UserDetailCoordinator) {
        self.userName = userName
        self.coordinator = coordinator
    }
    
    func fetchUserDetail() {
        let userDetailRequest = UsersDetailRequest(username: userName)
        session.request(request: userDetailRequest) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let response = response else { return }
                    let userID = response.user.id
                    let userName = response.user.username
                self.onUserDetailSuccess?(userID, userName)
            case .failure(let error):
                self.onUserDetailError?(error.localizedDescription)
            }
        }
    }
}
