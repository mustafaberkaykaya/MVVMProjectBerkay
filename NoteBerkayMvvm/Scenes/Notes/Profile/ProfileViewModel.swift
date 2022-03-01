//
//  ProfileViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

import Foundation

protocol ProfileViewDataSource {
    func getUser() -> User
}

protocol ProfileViewEventSource {
    var didSuccessFetchUser: VoidClosure? { get set }
}

protocol ProfileViewProtocol: ProfileViewDataSource, ProfileViewEventSource {
    func showNoteList()
    func pushSignOut()
    func pushChangePassword()
    func getUserRequest()
    func updateUser(userName: String, email: String)
}

final class ProfileViewModel: BaseViewModel<ProfileRouter>, ProfileViewProtocol {
    var didSuccessFetchUser: VoidClosure?
    var user: User = User(id: 0, userName: "", email: "")
    
    func getUser() -> User {
        return user
    }
    
    func showNoteList() {
        router.close()
    }
    
    func pushSignOut() {
        router.placeOnWindowLogin()
    }
    
    func pushChangePassword() {
        router.presentChangePassword()
    }
    
    func getUserRequest() {
        dataProvider.request(for: GetUserRequest()) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.user = response.data ?? User(id: 0, userName: "", email: "")
                self.didSuccessFetchUser?()
            case .failure(let err):
                self.showWarningToast?(err.localizedDescription)
            }
        }
    }
    
    func updateUser(userName: String, email: String) {
        dataProvider.request(for: UpdateUserRequest(userName: userName, email: email)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.showSuccessToast?("Success Update")
            case .failure(let err):
                self.showWarningToast?(err.localizedDescription)
            }
        }
    }
}
