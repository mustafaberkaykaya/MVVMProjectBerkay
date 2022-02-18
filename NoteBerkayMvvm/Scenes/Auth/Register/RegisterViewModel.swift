//
//  RegisterViewModel.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 18.02.2022.
//

import Foundation

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    
}
