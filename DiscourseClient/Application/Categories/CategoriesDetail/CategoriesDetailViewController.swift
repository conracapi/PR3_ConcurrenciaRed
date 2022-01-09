//
//  CategoriesDetailViewController.swift
//  DiscourseClient
//
//  Created by Conrado Capilla García on 6/1/22.
//

import UIKit

class CategoriesDetailViewController: UIViewController {

    @IBOutlet weak var idCategory: UILabel!
    @IBOutlet weak var nameCategory: UILabel!
    
    let viewModel: CategoriesDetailViewModel
    
    init (viewModel: CategoriesDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CategoriesDetailViewController", bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        viewModel.fetchCategoryDetail()
    }

    func bindViewModel(){
        viewModel.onCategoryDetailSuccess = { [weak self] categoryId, categoryName in
            self?.hideLoading()
            self?.idCategory.text = "id: \(categoryId)"
            self?.nameCategory.text = "name: \(categoryName)"
        }
        
        viewModel.onCategoryDetailError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }

}
