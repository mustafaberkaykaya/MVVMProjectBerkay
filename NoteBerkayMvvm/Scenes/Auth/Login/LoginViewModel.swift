//
//  LoginViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import Foundation
import Alamofire
import KeychainSwift

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func pushPasswordResetScene()
    func pushNotesScene()
    func pushRegisterScene()
    func sendLoginRequest(email: String, password: String)
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
    let keychain = KeychainSwift()
   
    func sendLoginRequest(email: String, password: String) {
        showLoading?()
        dataProvider.request(for: LoginRequest(email: email, password: password)) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case.success(let response):
                self.keychain.set(response.data?.accessToken ?? "", forKey: Keychain.token)
                print("başarılı login")
            case .failure:
                self.showWarningToast?(L10n.Login.error1)
            }
        }
    }
    
    func pushNotesScene() {
        print("Go Notes Scene")
    }
    
    func pushPasswordResetScene() {
        print("Go Password Reset")
    }
    
    func pushRegisterScene() {
        print("Go Register Scene")
        router.pushRegister()
    }
}
