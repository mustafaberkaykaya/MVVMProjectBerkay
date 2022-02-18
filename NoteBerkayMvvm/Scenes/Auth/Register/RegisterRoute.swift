//
//  RegisterRoute.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 18.02.2022.
//

protocol RegisterRoute {
    func pushRegister()
}

extension RegisterRoute where Self: RouterProtocol {
    
    func pushRegister() {
        let router = RegisterRouter()
        let viewModel = RegisterViewModel(router: router)
        let viewController = RegisterViewController(viewModel: viewModel)
        let navigationController = MainNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
