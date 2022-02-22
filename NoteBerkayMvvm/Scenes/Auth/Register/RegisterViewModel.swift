//
//  RegisterViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 18.02.2022.
//

import Foundation
import KeychainSwift
protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func pushPasswordResetScene()
    func pushNotesScene()
    func pushLoginScene()
    func sendRegisterRequest(username: String, email: String, password: String)
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    
    let keychain = KeychainSwift()
    
    func pushPasswordResetScene() {
        router.pushForgotPassword()
    }
    
    func pushNotesScene() {
        print("Push notes scene")
    }
    
    func pushLoginScene() {
        print("Push login scene")
    }
    
    func sendRegisterRequest(username: String, email: String, password: String) {
        showLoading?()
        dataProvider.request(for: RegisterRequest(fullName: username, email: email, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let response):
                self.keychain.set(response.data?.accessToken ?? "", forKey: Keychain.token)
                self.showSuccessToast?(L10n.Register.succes)
            case .failure(let err):
                self.showWarningToast?(L10n.Register.failed)
                print(err.localizedDescription)
            }
        }
    }
    
}
