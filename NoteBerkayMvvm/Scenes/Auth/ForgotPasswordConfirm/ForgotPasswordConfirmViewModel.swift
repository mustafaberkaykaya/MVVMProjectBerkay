//
//  ForgotPasswordConfirmViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//

import Foundation

protocol ForgotPasswordConfirmViewDataSource {}

protocol ForgotPasswordConfirmViewEventSource {}

protocol ForgotPasswordConfirmViewProtocol: ForgotPasswordConfirmViewDataSource, ForgotPasswordConfirmViewEventSource {
    
    func pushLoginScreen()
}

final class ForgotPasswordConfirmViewModel: BaseViewModel<ForgotPasswordConfirmRouter>, ForgotPasswordConfirmViewProtocol {
    
    func pushLoginScreen() {
        router.placeOnWindowLogin()
    }
}
