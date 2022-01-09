//
//  CategoriesDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Conrado Capilla García on 6/1/22.
//

import UIKit

final class CategoriesDetailCoordinator: Coordinator {
    
    var navigator: UINavigationController
    let categoryId: Int
    
    init(navigator: UINavigationController, categoryId: Int) {
        self.navigator = navigator
        self.categoryId = categoryId
    }
    
    func start() {
        let categoryDetailVM = CategoriesDetailViewModel(categoryId: categoryId, coordinator: self)
        let categoryDetailVC = CategoriesDetailViewController(viewModel: categoryDetailVM)
        categoryDetailVC.title = "Category Detail"
        navigator.pushViewController(categoryDetailVC, animated: true)
    }
    
}
