//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by Pablo Blanco Peris on 21/12/21.
//

import Foundation


protocol UsersViewProtocol: AnyObject {
    func usersFetched()
    func errorFetchingUsers()
}


final class UsersViewModel: ViewModel {
    
    private var directoryItems = [DirectoryItem]()
    weak var view: UsersViewProtocol?
    let coordinator: UsersCoordinator
    
    init (coordinator: UsersCoordinator) {
        self.coordinator = coordinator
    }
    
    var usersCount: Int {
        return directoryItems.count
    }
    
    func fetchUsers () {
        let request = UsersRequest()
        session.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success (let response):
                    guard let dirItems = response?.directoryItems else { return }
                    self.directoryItems = dirItems
                    // Llamamos al que implementa el protocolo
                    self.view?.usersFetched()
                case .failure:
                    // Llamamos al que implementa el protocolo
                    self.view?.errorFetchingUsers()
            }
        }
    }
    
    func getUser (at indexPath: IndexPath) -> User {
        return directoryItems[indexPath.row].user
    }
    
    func didSelectRowAt(at row: Int) {
        coordinator.didSelect(userName: directoryItems[row].user.username)
    }
    
}
