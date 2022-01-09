//
//  UIViewController+Extension.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 20/12/21.
//

import UIKit

extension UIViewController {
    
    // Función para mostrar el loader mientras se traen los datos de la API
    func showLoading() {
        // Vista principal donde se va a meter el loader
        let loaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        loaderView.tag = 999
        loaderView.backgroundColor = .black.withAlphaComponent(0.3)
        // Se crea el loader
        let loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        loader.center = loaderView.center
        loader.style = .large
        loader.color = .black
        loader.startAnimating()
        // Se añade el loader a la vista principal loaderView
        loaderView.addSubview(loader)
        // Se añade la vista del loaderView a la vista ppal de la app
        view.addSubview(loaderView)
    }
    
    // Función para eliminar la vista del loader de la vista ppal de la app
    func hideLoading() {
        view.viewWithTag(999)?.removeFromSuperview()
    }
    
    // función para mostrar una alerta en pantalla
    func showAlert(title: String, message: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
