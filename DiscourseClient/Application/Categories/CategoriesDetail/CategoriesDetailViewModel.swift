//
//  CategoriesDetailViewModel.swift
//  DiscourseClient
//
//  Created by Conrado Capilla García on 6/1/22.
//

import Foundation

final class CategoriesDetailViewModel: ViewModel {
    
    let categoryId: Int
    let coordinator: CategoriesDetailCoordinator
    
    var onCategoryDetailSuccess: ((String, String) -> Void)?
    var onCategoryDetailError: ((String) -> Void)?
    
    init(categoryId: Int, coordinator: CategoriesDetailCoordinator) {
        self.categoryId = categoryId
        self.coordinator = coordinator
    }
    
    func fetchCategoryDetail() {
        let categoryDetailRequest = CategoriesDetailRequest(id: categoryId)
        session.request(request: categoryDetailRequest) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success (let response):
                guard let response = response else { return }
                self.onCategoryDetailSuccess?("\(response.category.id)", "\(response.category.name)")
            case .failure(let error):
                self.onCategoryDetailError?(error.localizedDescription)
            }
        }
    }
    
}
