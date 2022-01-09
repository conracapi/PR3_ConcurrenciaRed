//
//  UserDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

final class UserDetailCoordinator: Coordinator {
    
    var navigator: UINavigationController
    let userName: String
    
    init (navigator: UINavigationController, userName: String) {
        self.navigator = navigator
        self.userName = userName
    }
    
    func start() {
        let userDetailVM = UserDetailViewModel(userName: userName, coordinator: self)
        let userDetailVC = UserDetailViewController (viewModel: userDetailVM)
        userDetailVC.title = "User detail"
        navigator.pushViewController(userDetailVC, animated: true)
    }
}
