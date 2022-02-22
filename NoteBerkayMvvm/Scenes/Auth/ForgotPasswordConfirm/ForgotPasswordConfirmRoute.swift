//
//  ForgotPasswordConfirmRoute.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 22.02.2022.
//

protocol ForgotPasswordConfirmRoute {
    func pushForgotPasswordConfirm(email: String)
}

extension ForgotPasswordConfirmRoute where Self: RouterProtocol {
    
    func pushForgotPasswordConfirm(email: String) {
        let router = ForgotPasswordConfirmRouter()
        let viewModel = ForgotPasswordConfirmViewModel(router: router)
        let viewController = ForgotPasswordConfirmViewController(viewModel: viewModel)
        viewModel.email = email
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
