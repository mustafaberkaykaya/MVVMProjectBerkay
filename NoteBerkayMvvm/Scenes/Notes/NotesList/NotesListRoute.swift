//
//  NotesListRoute.swift
//  NoteBerkayMvvm
//
//  Created by Mustafa Berkay Kaya on 23.02.2022.
//

protocol NotesListRoute {
    func pushNotesList()
}

extension NotesListRoute where Self: RouterProtocol {
    
    func pushNotesList() {
        let router = NotesListRouter()
        let viewModel = NotesListViewModel(router: router)
        let viewController = NotesListViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
