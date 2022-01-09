//
//  CategoriesViewController.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    let viewModel: CategoriesViewModel

    lazy var table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
        
    init(viewModel: CategoriesViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCategories()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .gray
        view.addSubview(table)
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}


extension CategoriesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categoriesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let category = viewModel.category(from: indexPath.row)
        cell.textLabel?.text = "\(category.id): \(category.name)"
        cell.backgroundColor = hexStringToUIColor(hex: category.color)
        return cell
    }
    
}


extension CategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRowAt(at: indexPath.row)
    }
    
}


extension CategoriesViewController: CategoriesViewProtocol {
    
    func categoriesFetched() {
        hideLoading()
        table.reloadData()
    }
    
    func errorFetchingCategories() {
        hideLoading()
        showAlert(title: "Error fetching topics")
    }
    
}


extension CategoriesViewController {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
