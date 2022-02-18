//
//  LoginRoute.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 10.02.2022.
//

import UIKit

protocol LoginRoute {
    func placeOnWindowLogin()
}

extension LoginRoute where Self: RouterProtocol {
    
    func placeOnWindowLogin() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        navigationController.navigationBar.topItem?.title = ""
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
