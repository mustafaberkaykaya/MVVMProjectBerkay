//
//  ForgotPasswordConfirmViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//

import Foundation

protocol ForgotPasswordConfirmViewDataSource {
    var email: String { get set }
}

protocol ForgotPasswordConfirmViewEventSource {}

protocol ForgotPasswordConfirmViewProtocol: ForgotPasswordConfirmViewDataSource, ForgotPasswordConfirmViewEventSource {
    
    func pushLoginScreen()
}

final class ForgotPasswordConfirmViewModel: BaseViewModel<ForgotPasswordConfirmRouter>, ForgotPasswordConfirmViewProtocol {
    var email: String = ""
    
    init(email: String, router: ForgotPasswordConfirmRouter) {
        super.init(router: router)
        self.email = email
    }
    
    func pushLoginScreen() {
        router.placeOnWindowLogin()
    }
}
