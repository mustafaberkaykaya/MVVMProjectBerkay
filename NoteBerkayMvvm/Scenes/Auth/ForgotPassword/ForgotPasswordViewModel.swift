//
//  ForgotPasswordViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//

import Foundation

protocol ForgotPasswordViewDataSource {}

protocol ForgotPasswordViewEventSource {}

protocol ForgotPasswordViewProtocol: ForgotPasswordViewDataSource, ForgotPasswordViewEventSource {
    func sendForgotPassRequest(email: String)
    func showConfirmMessage(email: String)
}

final class ForgotPasswordViewModel: BaseViewModel<ForgotPasswordRouter>, ForgotPasswordViewProtocol {
    func sendForgotPassRequest(email: String) {
        showLoading?()
        dataProvider.request(for: ForgotPasswordRequest(email: email)) { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case.success(let response):
                print("*********")
                print(response.message)
                self.showConfirmMessage(email: email)
            case.failure(let error):
            print(error)
            }
        }
    }
    
    func showConfirmMessage(email: String) {
        router.pushForgotPasswordConfirm(email: email)
    }
    
}
