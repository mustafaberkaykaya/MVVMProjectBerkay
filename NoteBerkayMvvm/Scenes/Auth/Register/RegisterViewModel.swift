//
//  RegisterViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 18.02.2022.
//

import Foundation

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {
    func pushPasswordResetScene()
    func pushNotesScene()
    func pushLoginScene()
}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    func pushPasswordResetScene() {
        print("Push reset password scene")
    }
    
    func pushNotesScene() {
        print("Push notes scene")
    }
    
    func pushLoginScene() {
        print("Push login scene")
    }
    
}
