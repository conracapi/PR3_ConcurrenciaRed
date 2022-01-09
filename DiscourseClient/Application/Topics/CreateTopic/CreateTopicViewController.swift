//
//  CreateTopicViewController.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

class CreateTopicViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var topicTextfield: UITextField!
    
    let viewModel: CreateTopicViewModel
    
    init(viewModel: CreateTopicViewModel){
        self.viewModel = viewModel
        super.init(nibName: "CreateTopicViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    // BINDING PORQUE LO HACEMOS CON CLOSURES, ESTAS FUNCIONES ESTAN DECLARADAS EN EL VIEWMODEL Y SE IMPLEMENTAN EN EL VIEWCONTROLLER PARA RECIBIR LA NOTIFICACION DESDE EL VIEWMODEL --> VIEWCONTROLLER

    func bindViewModel() {
        // IMPLEMENTAMOS LOS CLOSURE (FUNCIONES) DEL VIEWMODEL
        viewModel.onCreateTopicSuccess = { [weak self] in
            self?.hideLoading()
            self?.showAlert(title: "Create topic success")
        }
        
        viewModel.onCreateTopicError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }

    @IBAction func submitButtonAction(_ sender: Any) {
        guard let text = topicTextfield.text, !text.isEmpty else {
            showEmptyTextfieldAlert()
            return
        }
        showLoading()
        viewModel.onSubmitButtonTap(topicName: text)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        viewModel.onCloseButton()
    }
    
    func showEmptyTextfieldAlert() {
        showAlert(title: "Empty textfield")
    }
    
}
