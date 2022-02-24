//
//  AddNoteRoute.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 24.02.2022.
//

protocol AddNoteRoute {
    func pushAddNote()
}

extension AddNoteRoute where Self: RouterProtocol {
    
    func pushAddNote() {
        let router = AddNoteRouter()
        let viewModel = AddNoteViewModel(router: router)
        let viewController = AddNoteViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
