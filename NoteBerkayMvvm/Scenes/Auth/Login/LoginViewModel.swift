//
//  LoginViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import Foundation

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {
    func pushPasswordResetScene()
    func pushNotesScene()
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
  
    func pushNotesScene() {
        print("1")
    }
    
    func pushPasswordResetScene() {
        print("3")
    }
    
}
