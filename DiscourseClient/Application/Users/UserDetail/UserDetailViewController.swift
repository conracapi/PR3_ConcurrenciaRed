//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var idUser: UILabel!
    @IBOutlet weak var nameUser: UILabel!
    
    let viewModel: UserDetailViewModel
    
    init (viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "UserDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUserDetail()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        bindViewModel()
        
    }
    
    func bindViewModel () {
        
        viewModel.onUserDetailSuccess = { [weak self] id, username in
            self?.hideLoading()
            self?.idUser.text = "id: \(String(id))"
            self?.nameUser.text = "name: \(username)"
        }
        
        viewModel.onUserDetailError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
        
    }

}
