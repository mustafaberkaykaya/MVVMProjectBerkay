//
//  ChangePasswordRoute.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 1.03.2022.
//

protocol ChangePasswordRoute {
    func presentChangePassword()
}

extension ChangePasswordRoute where Self: RouterProtocol {
    
    func presentChangePassword() {
        let router = ChangePasswordRouter()
        let viewModel = ChangePasswordViewModel(router: router)
        let viewController = ChangePasswordViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
