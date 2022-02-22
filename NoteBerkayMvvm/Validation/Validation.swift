//
//  Validation.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 21.02.2022.
//

import Foundation

class Validation {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        guard emailPred.evaluate(with: email) else {
            ToastPresenter.showWarningToast(text: L10n.Validation.email)
            return false
        }
        return true
    }
    
    func isValidPassword(_ password: String) -> Bool {
        guard password.count > 5 else {
            ToastPresenter.showWarningToast(text: L10n.Validation.password)
            return false
        }
        return true
    }
}
