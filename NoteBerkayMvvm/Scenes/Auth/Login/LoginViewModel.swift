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
    func pushRegisterScene()
}

final class LoginViewModel: BaseViewModel<LoginRouter>, LoginViewProtocol {
  
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
