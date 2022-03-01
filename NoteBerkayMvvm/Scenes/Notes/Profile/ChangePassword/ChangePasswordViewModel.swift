//
//  ChangePasswordViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

import Foundation

protocol ChangePasswordViewDataSource {}

protocol ChangePasswordViewEventSource {}

protocol ChangePasswordViewProtocol: ChangePasswordViewDataSource, ChangePasswordViewEventSource {
    func changePassword(password: String, newPassword: String, retypeNewPassword: String)
    func showHomeScreen()
}

final class ChangePasswordViewModel: BaseViewModel<ChangePasswordRouter>, ChangePasswordViewProtocol {
    
    func changePassword(password: String, newPassword: String, retypeNewPassword: String) {
        dataProvider.request(for: ChangePasswordRequest(password: password,
                                                        newPassword: newPassword,
                                                        newPasswordConfirmation:
                                                        retypeNewPassword)) { [weak self] result in
            switch result {
            case .success:
                ToastPresenter.showSuccessToast(text: L10n.ChangePassword.succes)
            case .failure(let err):
                ToastPresenter.showWarningToast(text: err.localizedDescription)
            }
        }
    }
    
    func showHomeScreen() {
        router.close()
    }
    
}
