//
//  CategoriesCoordinator.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

final class CategoriesCoordinator: Coordinator {
    
    var navigator: UINavigationController
        
    init (navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        
        let categoriesViewModel = CategoriesViewModel(coordinator: self)
        let categoriesViewController = CategoriesViewController(viewModel: categoriesViewModel)
        categoriesViewController.title = "Categories"

        // Se le dice al viewModel quien implementa su protocolo
        categoriesViewModel.view = categoriesViewController
        
        navigator.pushViewController(categoriesViewController, animated: false)
    }
    
    func didSelect(categoryId: Int) {
        let categoryDetailCoordinator = CategoriesDetailCoordinator(navigator: navigator, categoryId: categoryId)
        categoryDetailCoordinator.start()
    }
    
    
}
